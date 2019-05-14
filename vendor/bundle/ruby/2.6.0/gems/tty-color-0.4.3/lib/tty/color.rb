# frozen_string_literal: true

require_relative 'color/support'
require_relative 'color/mode'
require_relative 'color/version'

module TTY
  # Responsible for checking terminal color support
  #
  # @api public
  module Color
    extend self

    NoValue = Module.new

    @verbose = false

    @output = $stderr

    attr_accessor :output, :verbose

    # Check if terminal supports colors
    #
    # @return [Boolean]
    #
    # @api public
    def supports?
      Support.new(ENV, verbose: verbose).supports?
    end
    alias color? supports?
    alias supports_color? supports?

    # Check how many colors this terminal supports
    #
    # @return [Integer]
    #
    # @api public
    def mode
      Mode.new(ENV).mode
    end

    # Check if output is linked with terminal
    #
    # @return [Boolean]
    #
    # @api public
    def tty?
      output.respond_to?(:tty?) && output.tty?
    end

    # Check if command can be run
    #
    # @return [Boolean]
    #
    # @api public
    def command?(cmd)
      !!system(cmd, out: ::File::NULL, err: ::File::NULL)
    end

    # Check if Windowz
    #
    # @return [Boolean]
    #
    # @api public
    def windows?
      ::File::ALT_SEPARATOR == "\\"
    end
  end # Color
end # TTY
