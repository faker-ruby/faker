require 'concurrent/executor/abstract_executor_service'
require 'concurrent/atomic/event'

module Concurrent

  # @!macro abstract_executor_service_public_api
  # @!visibility private
  class RubyExecutorService < AbstractExecutorService
    safe_initialization!

    def initialize(*args, &block)
      super
      @StopEvent    = Event.new
      @StoppedEvent = Event.new
    end

    def post(*args, &task)
      raise ArgumentError.new('no block given') unless block_given?
      synchronize do
        # If the executor is shut down, reject this task
        return handle_fallback(*args, &task) unless running?
        ns_execute(*args, &task)
        true
      end
    end

    def shutdown
      synchronize do
        break unless running?
        self.ns_auto_terminate = false
        stop_event.set
        ns_shutdown_execution
      end
      true
    end

    def kill
      synchronize do
        break if shutdown?
        self.ns_auto_terminate = false
        stop_event.set
        ns_kill_execution
        stopped_event.set
      end
      true
    end

    def wait_for_termination(timeout = nil)
      stopped_event.wait(timeout)
    end

    private

    def stop_event
      @StopEvent
    end

    def stopped_event
      @StoppedEvent
    end

    def ns_shutdown_execution
      stopped_event.set
    end

    def ns_running?
      !stop_event.set?
    end

    def ns_shuttingdown?
      !(ns_running? || ns_shutdown?)
    end

    def ns_shutdown?
      stopped_event.set?
    end
  end
end
