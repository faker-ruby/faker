# encoding: UTF-8

require "rbconfig"
require "tempfile"
require "stringio"

module Minitest
  ##
  # Minitest Assertions.  All assertion methods accept a +msg+ which is
  # printed if the assertion fails.
  #
  # Protocol: Nearly everything here boils up to +assert+, which
  # expects to be able to increment an instance accessor named
  # +assertions+. This is not provided by Assertions and must be
  # provided by the thing including Assertions. See Minitest::Runnable
  # for an example.

  module Assertions
    UNDEFINED = Object.new # :nodoc:

    def UNDEFINED.inspect # :nodoc:
      "UNDEFINED" # again with the rdoc bugs... :(
    end

    ##
    # Returns the diff command to use in #diff. Tries to intelligently
    # figure out what diff to use.

    def self.diff
      @diff = if (RbConfig::CONFIG["host_os"] =~ /mswin|mingw/ &&
                  system("diff.exe", __FILE__, __FILE__)) then
                "diff.exe -u"
              elsif Minitest::Test.maglev? then
                "diff -u"
              elsif system("gdiff", __FILE__, __FILE__)
                "gdiff -u" # solaris and kin suck
              elsif system("diff", __FILE__, __FILE__)
                "diff -u"
              else
                nil
              end unless defined? @diff

      @diff
    end

    ##
    # Set the diff command to use in #diff.

    def self.diff= o
      @diff = o
    end

    ##
    # Returns a diff between +exp+ and +act+. If there is no known
    # diff command or if it doesn't make sense to diff the output
    # (single line, short output), then it simply returns a basic
    # comparison between the two.

    def diff exp, act
      expect = mu_pp_for_diff exp
      butwas = mu_pp_for_diff act
      result = nil

      need_to_diff =
        (expect.include?("\n")    ||
         butwas.include?("\n")    ||
         expect.size > 30         ||
         butwas.size > 30         ||
         expect == butwas)        &&
        Minitest::Assertions.diff

      return "Expected: #{mu_pp exp}\n  Actual: #{mu_pp act}" unless
        need_to_diff

      Tempfile.open("expect") do |a|
        a.puts expect
        a.flush

        Tempfile.open("butwas") do |b|
          b.puts butwas
          b.flush

          result = `#{Minitest::Assertions.diff} #{a.path} #{b.path}`
          result.sub!(/^\-\-\- .+/, "--- expected")
          result.sub!(/^\+\+\+ .+/, "+++ actual")

          if result.empty? then
            klass = exp.class
            result = [
                      "No visible difference in the #{klass}#inspect output.\n",
                      "You should look at the implementation of #== on ",
                      "#{klass} or its members.\n",
                      expect,
                     ].join
          end
        end
      end

      result
    end

    ##
    # This returns a human-readable version of +obj+. By default
    # #inspect is called. You can override this to use #pretty_print
    # if you want.

    def mu_pp obj
      s = obj.inspect

      if defined? Encoding then
        s = s.encode Encoding.default_external

        if String === obj && obj.encoding != Encoding.default_external then
          s = "# encoding: #{obj.encoding}\n#{s}"
        end
      end

      s
    end

    ##
    # This returns a diff-able human-readable version of +obj+. This
    # differs from the regular mu_pp because it expands escaped
    # newlines and makes hex-values generic (like object_ids). This
    # uses mu_pp to do the first pass and then cleans it up.

    def mu_pp_for_diff obj
      mu_pp(obj).gsub(/\\n/, "\n").gsub(/:0x[a-fA-F0-9]{4,}/m, ":0xXXXXXX")
    end

    ##
    # Fails unless +test+ is truthy.

    def assert test, msg = nil
      self.assertions += 1
      unless test then
        msg ||= "Expected #{mu_pp test} to be truthy."
        msg = msg.call if Proc === msg
        raise Minitest::Assertion, msg
      end
      true
    end

    def _synchronize # :nodoc:
      yield
    end

    ##
    # Fails unless +obj+ is empty.

    def assert_empty obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to be empty" }
      assert_respond_to obj, :empty?
      assert obj.empty?, msg
    end

    E = "" # :nodoc:

    ##
    # Fails unless <tt>exp == act</tt> printing the difference between
    # the two, if possible.
    #
    # If there is no visible difference but the assertion fails, you
    # should suspect that your #== is buggy, or your inspect output is
    # missing crucial details.  For nicer structural diffing, set
    # Minitest::Test.make_my_diffs_pretty!
    #
    # For floats use assert_in_delta.
    #
    # See also: Minitest::Assertions.diff

    def assert_equal exp, act, msg = nil
      msg = message(msg, E) { diff exp, act }
      result = assert exp == act, msg

      if nil == exp then
        if Minitest::VERSION =~ /^6/ then
          refute_nil exp, "Use assert_nil if expecting nil."
        else
          where = Minitest.filter_backtrace(caller).first
          where = where.split(/:in /, 2).first # clean up noise

          warn "DEPRECATED: Use assert_nil if expecting nil from #{where}. This will fail in Minitest 6."
        end
      end

      result
    end

    ##
    # For comparing Floats.  Fails unless +exp+ and +act+ are within +delta+
    # of each other.
    #
    #   assert_in_delta Math::PI, (22.0 / 7.0), 0.01

    def assert_in_delta exp, act, delta = 0.001, msg = nil
      n = (exp - act).abs
      msg = message(msg) {
        "Expected |#{exp} - #{act}| (#{n}) to be <= #{delta}"
      }
      assert delta >= n, msg
    end

    ##
    # For comparing Floats.  Fails unless +exp+ and +act+ have a relative
    # error less than +epsilon+.

    def assert_in_epsilon exp, act, epsilon = 0.001, msg = nil
      assert_in_delta exp, act, [exp.abs, act.abs].min * epsilon, msg
    end

    ##
    # Fails unless +collection+ includes +obj+.

    def assert_includes collection, obj, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(collection)} to include #{mu_pp(obj)}"
      }
      assert_respond_to collection, :include?
      assert collection.include?(obj), msg
    end

    ##
    # Fails unless +obj+ is an instance of +cls+.

    def assert_instance_of cls, obj, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(obj)} to be an instance of #{cls}, not #{obj.class}"
      }

      assert obj.instance_of?(cls), msg
    end

    ##
    # Fails unless +obj+ is a kind of +cls+.

    def assert_kind_of cls, obj, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(obj)} to be a kind of #{cls}, not #{obj.class}" }

      assert obj.kind_of?(cls), msg
    end

    ##
    # Fails unless +matcher+ <tt>=~</tt> +obj+.

    def assert_match matcher, obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp matcher} to match #{mu_pp obj}" }
      assert_respond_to matcher, :"=~"
      matcher = Regexp.new Regexp.escape matcher if String === matcher
      assert matcher =~ obj, msg
    end

    ##
    # Fails unless +obj+ is nil

    def assert_nil obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to be nil" }
      assert obj.nil?, msg
    end

    ##
    # For testing with binary operators. Eg:
    #
    #   assert_operator 5, :<=, 4

    def assert_operator o1, op, o2 = UNDEFINED, msg = nil
      return assert_predicate o1, op, msg if UNDEFINED == o2
      msg = message(msg) { "Expected #{mu_pp(o1)} to be #{op} #{mu_pp(o2)}" }
      assert o1.__send__(op, o2), msg
    end

    ##
    # Fails if stdout or stderr do not output the expected results.
    # Pass in nil if you don't care about that streams output. Pass in
    # "" if you require it to be silent. Pass in a regexp if you want
    # to pattern match.
    #
    #   assert_output(/hey/) { method_with_output }
    #
    # NOTE: this uses #capture_io, not #capture_subprocess_io.
    #
    # See also: #assert_silent

    def assert_output stdout = nil, stderr = nil
      out, err = capture_io do
        yield
      end

      err_msg = Regexp === stderr ? :assert_match : :assert_equal if stderr
      out_msg = Regexp === stdout ? :assert_match : :assert_equal if stdout

      y = send err_msg, stderr, err, "In stderr" if err_msg
      x = send out_msg, stdout, out, "In stdout" if out_msg

      (!stdout || x) && (!stderr || y)
    end

    ##
    # For testing with predicates. Eg:
    #
    #   assert_predicate str, :empty?
    #
    # This is really meant for specs and is front-ended by assert_operator:
    #
    #   str.must_be :empty?

    def assert_predicate o1, op, msg = nil
      msg = message(msg) { "Expected #{mu_pp(o1)} to be #{op}" }
      assert o1.__send__(op), msg
    end

    ##
    # Fails unless the block raises one of +exp+. Returns the
    # exception matched so you can check the message, attributes, etc.
    #
    # +exp+ takes an optional message on the end to help explain
    # failures and defaults to StandardError if no exception class is
    # passed.

    def assert_raises *exp
      msg = "#{exp.pop}.\n" if String === exp.last
      exp << StandardError if exp.empty?

      begin
        yield
      rescue *exp => e
        pass # count assertion
        return e
      rescue Minitest::Skip, Minitest::Assertion
        # don't count assertion
        raise
      rescue SignalException, SystemExit
        raise
      rescue Exception => e
        flunk proc {
          exception_details(e, "#{msg}#{mu_pp(exp)} exception expected, not")
        }
      end

      exp = exp.first if exp.size == 1

      flunk "#{msg}#{mu_pp(exp)} expected but nothing was raised."
    end

    ##
    # Fails unless +obj+ responds to +meth+.

    def assert_respond_to obj, meth, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(obj)} (#{obj.class}) to respond to ##{meth}"
      }
      assert obj.respond_to?(meth), msg
    end

    ##
    # Fails unless +exp+ and +act+ are #equal?

    def assert_same exp, act, msg = nil
      msg = message(msg) {
        data = [mu_pp(act), act.object_id, mu_pp(exp), exp.object_id]
        "Expected %s (oid=%d) to be the same as %s (oid=%d)" % data
      }
      assert exp.equal?(act), msg
    end

    ##
    # +send_ary+ is a receiver, message and arguments.
    #
    # Fails unless the call returns a true value

    def assert_send send_ary, m = nil
      where = Minitest.filter_backtrace(caller).first
      where = where.split(/:in /, 2).first # clean up noise
      warn "DEPRECATED: assert_send. From #{where}"

      recv, msg, *args = send_ary
      m = message(m) {
        "Expected #{mu_pp(recv)}.#{msg}(*#{mu_pp(args)}) to return true" }
      assert recv.__send__(msg, *args), m
    end

    ##
    # Fails if the block outputs anything to stderr or stdout.
    #
    # See also: #assert_output

    def assert_silent
      assert_output "", "" do
        yield
      end
    end

    ##
    # Fails unless the block throws +sym+

    def assert_throws sym, msg = nil
      default = "Expected #{mu_pp(sym)} to have been thrown"
      caught = true
      catch(sym) do
        begin
          yield
        rescue ThreadError => e       # wtf?!? 1.8 + threads == suck
          default += ", not \:#{e.message[/uncaught throw \`(\w+?)\'/, 1]}"
        rescue ArgumentError => e     # 1.9 exception
          raise e unless e.message.include?("uncaught throw")
          default += ", not #{e.message.split(/ /).last}"
        rescue NameError => e         # 1.8 exception
          raise e unless e.name == sym
          default += ", not #{e.name.inspect}"
        end
        caught = false
      end

      assert caught, message(msg) { default }
    end

    ##
    # Captures $stdout and $stderr into strings:
    #
    #   out, err = capture_io do
    #     puts "Some info"
    #     warn "You did a bad thing"
    #   end
    #
    #   assert_match %r%info%, out
    #   assert_match %r%bad%, err
    #
    # NOTE: For efficiency, this method uses StringIO and does not
    # capture IO for subprocesses. Use #capture_subprocess_io for
    # that.

    def capture_io
      _synchronize do
        begin
          captured_stdout, captured_stderr = StringIO.new, StringIO.new

          orig_stdout, orig_stderr = $stdout, $stderr
          $stdout, $stderr         = captured_stdout, captured_stderr

          yield

          return captured_stdout.string, captured_stderr.string
        ensure
          $stdout = orig_stdout
          $stderr = orig_stderr
        end
      end
    end

    ##
    # Captures $stdout and $stderr into strings, using Tempfile to
    # ensure that subprocess IO is captured as well.
    #
    #   out, err = capture_subprocess_io do
    #     system "echo Some info"
    #     system "echo You did a bad thing 1>&2"
    #   end
    #
    #   assert_match %r%info%, out
    #   assert_match %r%bad%, err
    #
    # NOTE: This method is approximately 10x slower than #capture_io so
    # only use it when you need to test the output of a subprocess.

    def capture_subprocess_io
      _synchronize do
        begin
          require "tempfile"

          captured_stdout, captured_stderr = Tempfile.new("out"), Tempfile.new("err")

          orig_stdout, orig_stderr = $stdout.dup, $stderr.dup
          $stdout.reopen captured_stdout
          $stderr.reopen captured_stderr

          yield

          $stdout.rewind
          $stderr.rewind

          return captured_stdout.read, captured_stderr.read
        ensure
          captured_stdout.unlink
          captured_stderr.unlink
          $stdout.reopen orig_stdout
          $stderr.reopen orig_stderr
        end
      end
    end

    ##
    # Returns details for exception +e+

    def exception_details e, msg
      [
       "#{msg}",
       "Class: <#{e.class}>",
       "Message: <#{e.message.inspect}>",
       "---Backtrace---",
       "#{Minitest.filter_backtrace(e.backtrace).join("\n")}",
       "---------------",
      ].join "\n"
    end

    ##
    # Fails with +msg+

    def flunk msg = nil
      msg ||= "Epic Fail!"
      assert false, msg
    end

    ##
    # Returns a proc that will output +msg+ along with the default message.

    def message msg = nil, ending = nil, &default
      proc {
        msg = msg.call.chomp(".") if Proc === msg
        custom_message = "#{msg}.\n" unless msg.nil? or msg.to_s.empty?
        "#{custom_message}#{default.call}#{ending || "."}"
      }
    end

    ##
    # used for counting assertions

    def pass _msg = nil
      assert true
    end

    ##
    # Fails if +test+ is truthy.

    def refute test, msg = nil
      msg ||= message { "Expected #{mu_pp(test)} to not be truthy" }
      not assert !test, msg
    end

    ##
    # Fails if +obj+ is empty.

    def refute_empty obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to not be empty" }
      assert_respond_to obj, :empty?
      refute obj.empty?, msg
    end

    ##
    # Fails if <tt>exp == act</tt>.
    #
    # For floats use refute_in_delta.

    def refute_equal exp, act, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(act)} to not be equal to #{mu_pp(exp)}"
      }
      refute exp == act, msg
    end

    ##
    # For comparing Floats.  Fails if +exp+ is within +delta+ of +act+.
    #
    #   refute_in_delta Math::PI, (22.0 / 7.0)

    def refute_in_delta exp, act, delta = 0.001, msg = nil
      n = (exp - act).abs
      msg = message(msg) {
        "Expected |#{exp} - #{act}| (#{n}) to not be <= #{delta}"
      }
      refute delta >= n, msg
    end

    ##
    # For comparing Floats.  Fails if +exp+ and +act+ have a relative error
    # less than +epsilon+.

    def refute_in_epsilon a, b, epsilon = 0.001, msg = nil
      refute_in_delta a, b, a * epsilon, msg
    end

    ##
    # Fails if +collection+ includes +obj+.

    def refute_includes collection, obj, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(collection)} to not include #{mu_pp(obj)}"
      }
      assert_respond_to collection, :include?
      refute collection.include?(obj), msg
    end

    ##
    # Fails if +obj+ is an instance of +cls+.

    def refute_instance_of cls, obj, msg = nil
      msg = message(msg) {
        "Expected #{mu_pp(obj)} to not be an instance of #{cls}"
      }
      refute obj.instance_of?(cls), msg
    end

    ##
    # Fails if +obj+ is a kind of +cls+.

    def refute_kind_of cls, obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to not be a kind of #{cls}" }
      refute obj.kind_of?(cls), msg
    end

    ##
    # Fails if +matcher+ <tt>=~</tt> +obj+.

    def refute_match matcher, obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp matcher} to not match #{mu_pp obj}" }
      assert_respond_to matcher, :"=~"
      matcher = Regexp.new Regexp.escape matcher if String === matcher
      refute matcher =~ obj, msg
    end

    ##
    # Fails if +obj+ is nil.

    def refute_nil obj, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to not be nil" }
      refute obj.nil?, msg
    end

    ##
    # Fails if +o1+ is not +op+ +o2+. Eg:
    #
    #   refute_operator 1, :>, 2 #=> pass
    #   refute_operator 1, :<, 2 #=> fail

    def refute_operator o1, op, o2 = UNDEFINED, msg = nil
      return refute_predicate o1, op, msg if UNDEFINED == o2
      msg = message(msg) { "Expected #{mu_pp(o1)} to not be #{op} #{mu_pp(o2)}" }
      refute o1.__send__(op, o2), msg
    end

    ##
    # For testing with predicates.
    #
    #   refute_predicate str, :empty?
    #
    # This is really meant for specs and is front-ended by refute_operator:
    #
    #   str.wont_be :empty?

    def refute_predicate o1, op, msg = nil
      msg = message(msg) { "Expected #{mu_pp(o1)} to not be #{op}" }
      refute o1.__send__(op), msg
    end

    ##
    # Fails if +obj+ responds to the message +meth+.

    def refute_respond_to obj, meth, msg = nil
      msg = message(msg) { "Expected #{mu_pp(obj)} to not respond to #{meth}" }

      refute obj.respond_to?(meth), msg
    end

    ##
    # Fails if +exp+ is the same (by object identity) as +act+.

    def refute_same exp, act, msg = nil
      msg = message(msg) {
        data = [mu_pp(act), act.object_id, mu_pp(exp), exp.object_id]
        "Expected %s (oid=%d) to not be the same as %s (oid=%d)" % data
      }
      refute exp.equal?(act), msg
    end

    ##
    # Skips the current run. If run in verbose-mode, the skipped run
    # gets listed at the end of the run but doesn't cause a failure
    # exit code.

    def skip msg = nil, bt = caller
      msg ||= "Skipped, no message given"
      @skip = true
      raise Minitest::Skip, msg, bt
    end

    ##
    # Was this testcase skipped? Meant for #teardown.

    def skipped?
      defined?(@skip) and @skip
    end
  end
end
