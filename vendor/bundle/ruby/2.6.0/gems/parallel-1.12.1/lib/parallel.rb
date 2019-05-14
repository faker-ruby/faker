require 'rbconfig'
require 'parallel/version'
require 'parallel/processor_count'

module Parallel
  extend Parallel::ProcessorCount

  class DeadWorker < StandardError
  end

  class Break < StandardError
  end

  class Kill < StandardError
  end

  class UndumpableException < StandardError
    attr_reader :backtrace
    def initialize(original)
      super "#{original.class}: #{original.message}"
      @backtrace = original.backtrace
    end
  end

  Stop = Object.new

  class ExceptionWrapper
    attr_reader :exception
    def initialize(exception)
      # Remove the bindings stack added by the better_errors gem,
      # because it cannot be marshalled
      if exception.instance_variable_defined? :@__better_errors_bindings_stack
        exception.send :remove_instance_variable, :@__better_errors_bindings_stack
      end

      @exception =
        begin
          Marshal.dump(exception) && exception
        rescue
          UndumpableException.new(exception)
        end
    end
  end

  class Worker
    attr_reader :pid, :read, :write
    attr_accessor :thread
    def initialize(read, write, pid)
      @read, @write, @pid = read, write, pid
    end

    def stop
      close_pipes
      wait # if it goes zombie, rather wait here to be able to debug
    end

    # might be passed to started_processes and simultaneously closed by another thread
    # when running in isolation mode, so we have to check if it is closed before closing
    def close_pipes
      read.close unless read.closed?
      write.close unless write.closed?
    end

    def work(data)
      begin
        Marshal.dump(data, write)
      rescue Errno::EPIPE
        raise DeadWorker
      end

      result = begin
        Marshal.load(read)
      rescue EOFError
        raise DeadWorker
      end
      raise result.exception if ExceptionWrapper === result
      result
    end

    private

    def wait
      Process.wait(pid)
    rescue Interrupt
      # process died
    end
  end

  class JobFactory
    def initialize(source, mutex)
      @lambda = (source.respond_to?(:call) && source) || queue_wrapper(source)
      @source = source.to_a unless @lambda # turn Range and other Enumerable-s into an Array
      @mutex = mutex
      @index = -1
      @stopped = false
    end

    def next
      if producer?
        # - index and item stay in sync
        # - do not call lambda after it has returned Stop
        item, index = @mutex.synchronize do
          return if @stopped
          item = @lambda.call
          @stopped = (item == Parallel::Stop)
          return if @stopped
          [item, @index += 1]
        end
      else
        index = @mutex.synchronize { @index += 1 }
        return if index >= size
        item = @source[index]
      end
      [item, index]
    end

    def size
      if producer?
        Float::INFINITY
      else
        @source.size
      end
    end

    # generate item that is sent to workers
    # just index is faster + less likely to blow up with unserializable errors
    def pack(item, index)
      producer? ? [item, index] : index
    end

    # unpack item that is sent to workers
    def unpack(data)
      producer? ? data : [@source[data], data]
    end

    private

    def producer?
      @lambda
    end

    def queue_wrapper(array)
      array.respond_to?(:num_waiting) && array.respond_to?(:pop) && lambda { array.pop(false) }
    end
  end

  class UserInterruptHandler
    INTERRUPT_SIGNAL = :SIGINT

    class << self
      # kill all these pids or threads if user presses Ctrl+c
      def kill_on_ctrl_c(pids, options)
        @to_be_killed ||= []
        old_interrupt = nil
        signal = options.fetch(:interrupt_signal, INTERRUPT_SIGNAL)

        if @to_be_killed.empty?
          old_interrupt = trap_interrupt(signal) do
            $stderr.puts 'Parallel execution interrupted, exiting ...'
            @to_be_killed.flatten.each { |pid| kill(pid) }
          end
        end

        @to_be_killed << pids

        yield
      ensure
        @to_be_killed.pop # do not kill pids that could be used for new processes
        restore_interrupt(old_interrupt, signal) if @to_be_killed.empty?
      end

      def kill(thing)
        Process.kill(:KILL, thing)
      rescue Errno::ESRCH
        # some linux systems already automatically killed the children at this point
        # so we just ignore them not being there
      end

      private

      def trap_interrupt(signal)
        old = Signal.trap signal, 'IGNORE'

        Signal.trap signal do
          yield
          if !old || old == "DEFAULT"
            raise Interrupt
          else
            old.call
          end
        end

        old
      end

      def restore_interrupt(old, signal)
        Signal.trap signal, old
      end
    end
  end

  class << self
    def in_threads(options={:count => 2})
      count, _ = extract_count_from_options(options)
      Array.new(count) do |i|
        Thread.new { yield(i) }
      end.map!(&:value)
    end

    def in_processes(options = {}, &block)
      count, options = extract_count_from_options(options)
      count ||= processor_count
      map(0...count, options.merge(:in_processes => count), &block)
    end

    def each(array, options={}, &block)
      map(array, options.merge(:preserve_results => false), &block)
    end

    def any?(*args, &block)
      raise "You must provide a block when calling #any?" if block.nil?
      !each(*args) { |*a| raise Parallel::Kill if block.call(*a) }
    end

    def all?(*args, &block)
      raise "You must provide a block when calling #all?" if block.nil?
      !!each(*args) { |*a| raise Parallel::Kill unless block.call(*a) }
    end

    def each_with_index(array, options={}, &block)
      each(array, options.merge(:with_index => true), &block)
    end

    def map(source, options = {}, &block)
      options[:mutex] = Mutex.new

      if RUBY_PLATFORM =~ /java/ and not options[:in_processes]
        method = :in_threads
        size = options[method] || processor_count
      elsif options[:in_threads]
        method = :in_threads
        size = options[method]
      else
        method = :in_processes
        if Process.respond_to?(:fork)
          size = options[method] || processor_count
        else
          warn "Process.fork is not supported by this Ruby"
          size = 0
        end
      end

      job_factory = JobFactory.new(source, options[:mutex])
      size = [job_factory.size, size].min

      options[:return_results] = (options[:preserve_results] != false || !!options[:finish])
      add_progress_bar!(job_factory, options)

      results = if size == 0
        work_direct(job_factory, options, &block)
      elsif method == :in_threads
        work_in_threads(job_factory, options.merge(:count => size), &block)
      else
        work_in_processes(job_factory, options.merge(:count => size), &block)
      end
      if results
        options[:return_results] ? results : source
      end
    end

    def map_with_index(array, options={}, &block)
      map(array, options.merge(:with_index => true), &block)
    end

    def worker_number
      Thread.current[:parallel_worker_number]
    end

    def worker_number=(worker_num)
      Thread.current[:parallel_worker_number] = worker_num
    end

    private

    def add_progress_bar!(job_factory, options)
      if progress_options = options[:progress]
        raise "Progressbar can only be used with array like items" if job_factory.size == Float::INFINITY
        require 'ruby-progressbar'

        if progress_options == true
          progress_options = { title: "Progress" }
        elsif progress_options.respond_to? :to_str
          progress_options = { title: progress_options.to_str }
        end

        progress_options = {
          total: job_factory.size,
          format: '%t |%E | %B | %a'
        }.merge(progress_options)

        progress = ProgressBar.create(progress_options)
        old_finish = options[:finish]
        options[:finish] = lambda do |item, i, result|
          old_finish.call(item, i, result) if old_finish
          progress.increment
        end
      end
    end

    def work_direct(job_factory, options, &block)
      self.worker_number = 0
      results = []
      exception = nil
      begin
        while set = job_factory.next
          item, index = set
          results << with_instrumentation(item, index, options) do
            call_with_index(item, index, options, &block)
          end
        end
      rescue
        exception = $!
      end
      handle_exception(exception, results)
    ensure
      self.worker_number = nil
    end

    def work_in_threads(job_factory, options, &block)
      raise "interrupt_signal is no longer supported for threads" if options[:interrupt_signal]
      results = []
      results_mutex = Mutex.new # arrays are not thread-safe on jRuby
      exception = nil

      in_threads(options) do |worker_num|
        self.worker_number = worker_num
        # as long as there are more jobs, work on one of them
        while !exception && set = job_factory.next
          begin
            item, index = set
            result = with_instrumentation item, index, options do
              call_with_index(item, index, options, &block)
            end
            results_mutex.synchronize { results[index] = result }
          rescue
            exception = $!
          end
        end
      end

      handle_exception(exception, results)
    end

    def work_in_processes(job_factory, options, &blk)
      workers = if options[:isolation]
        [] # we create workers per job and not beforehand
      else
        create_workers(job_factory, options, &blk)
      end
      results = []
      results_mutex = Mutex.new # arrays are not thread-safe
      exception = nil

      UserInterruptHandler.kill_on_ctrl_c(workers.map(&:pid), options) do
        in_threads(options) do |i|
          worker = workers[i]

          begin
            loop do
              break if exception
              item, index = job_factory.next
              break unless index

              if options[:isolation]
                worker = replace_worker(job_factory, workers, i, options, blk)
              end

              worker.thread = Thread.current

              begin
                result = with_instrumentation item, index, options do
                  worker.work(job_factory.pack(item, index))
                end
                results_mutex.synchronize { results[index] = result } # arrays are not threads safe on jRuby
              rescue
                exception = $!
                if Parallel::Kill === exception
                  (workers - [worker]).each do |w|
                    w.thread.kill unless w.thread.nil?
                    UserInterruptHandler.kill(w.pid)
                  end
                end
              end
            end
          ensure
            worker.stop if worker
          end
        end
      end

      handle_exception(exception, results)
    end

    def replace_worker(job_factory, workers, i, options, blk)
      options[:mutex].synchronize do
        # old worker is no longer used ... stop it
        worker = workers[i]
        worker.stop if worker

        # create a new replacement worker
        running = workers - [worker]
        workers[i] = worker(job_factory, options.merge(started_workers: running, worker_number: i), &blk)
      end
    end

    def create_workers(job_factory, options, &block)
      workers = []
      Array.new(options[:count]).each_with_index do |_, i|
        workers << worker(job_factory, options.merge(started_workers: workers, worker_number: i), &block)
      end
      workers
    end

    def worker(job_factory, options, &block)
      child_read, parent_write = IO.pipe
      parent_read, child_write = IO.pipe

      pid = Process.fork do
        self.worker_number = options[:worker_number]

        begin
          options.delete(:started_workers).each(&:close_pipes)

          parent_write.close
          parent_read.close

          process_incoming_jobs(child_read, child_write, job_factory, options, &block)
        ensure
          child_read.close
          child_write.close
        end
      end

      child_read.close
      child_write.close

      Worker.new(parent_read, parent_write, pid)
    end

    def process_incoming_jobs(read, write, job_factory, options, &block)
      until read.eof?
        data = Marshal.load(read)
        item, index = job_factory.unpack(data)
        result = begin
          call_with_index(item, index, options, &block)
        rescue
          ExceptionWrapper.new($!)
        end
        Marshal.dump(result, write)
      end
    end

    def handle_exception(exception, results)
      return nil if [Parallel::Break, Parallel::Kill].include? exception.class
      raise exception if exception
      results
    end

    # options is either a Integer or a Hash with :count
    def extract_count_from_options(options)
      if options.is_a?(Hash)
        count = options[:count]
      else
        count = options
        options = {}
      end
      [count, options]
    end

    def call_with_index(item, index, options, &block)
      args = [item]
      args << index if options[:with_index]
      if options[:return_results]
        block.call(*args)
      else
        block.call(*args)
        nil # avoid GC overhead of passing large results around
      end
    end

    def with_instrumentation(item, index, options)
      on_start = options[:start]
      on_finish = options[:finish]
      options[:mutex].synchronize { on_start.call(item, index) } if on_start
      result = yield
      options[:mutex].synchronize { on_finish.call(item, index, result) } if on_finish
      result unless options[:preserve_results] == false
    end
  end
end
