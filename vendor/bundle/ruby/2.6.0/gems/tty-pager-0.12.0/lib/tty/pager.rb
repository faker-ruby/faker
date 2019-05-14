# frozen_string_literal: true

require 'tty-screen'

require_relative 'pager/basic'
require_relative 'pager/null'
require_relative 'pager/system'
require_relative 'pager/version'

module TTY
  class Pager
    Error = Class.new(StandardError)

    # Select an appriopriate pager
    #
    # If the user disabled paging then a NullPager is returned,
    # otherwise a check is performed to find native system
    # command to perform pagination with SystemPager. Finally,
    # if no system command is found, a BasicPager is used which
    # is a pure Ruby implementation known to work on any platform.
    #
    # @api private
    def self.select_pager(enabled, commands)
      if !enabled
        NullPager
      elsif SystemPager.exec_available?(*commands)
        SystemPager
      else
        BasicPager
      end
    end

    # Create a pager
    #
    # @param [Hash] options
    # @option options [Proc] :prompt
    #   a proc object that accepts page number
    # @option options [IO] :input
    #   the object to send input to
    # @option options [IO] :output
    #   the object to send output to
    # @option options [Boolean] :enabled
    #   disable/enable text paging
    #
    # @api public
    def initialize(**options)
      @input   = options.fetch(:input)  { $stdin }
      @output  = options.fetch(:output) { $stdout }
      @enabled = options.fetch(:enabled) { true }
      commands = Array(options[:command])

      if self.class == TTY::Pager
        @pager = self.class.select_pager(@enabled, commands).new(options)
      end
    end

    # Check if pager is enabled
    #
    # @return [Boolean]
    #
    # @api public
    def enabled?
      !!@enabled
    end

    # Page the given text through the available pager
    #
    # @param [String] text
    #   the text to run through a pager
    #
    # @yield [Integer] page number
    #
    # @return [TTY::Pager]
    #
    # @api public
    def page(text, &callback)
      pager.page(text, &callback)
      self
    end

    # The terminal height
    #
    # @api public
    def page_height
      TTY::Screen.height
    end

    # The terminal width
    #
    # @api public
    def page_width
      TTY::Screen.width
    end

    protected

    attr_reader :output

    attr_reader :input

    attr_reader :pager

  end # Pager
end # TTY
