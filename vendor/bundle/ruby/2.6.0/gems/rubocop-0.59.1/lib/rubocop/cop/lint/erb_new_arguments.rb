# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      #
      # This cop emulates the following Ruby warnings in Ruby 2.6.
      #
      # % cat example.rb
      # ERB.new('hi', nil, '-', '@output_buffer')
      # % ruby -rerb example.rb
      # example.rb:1: warning: Passing safe_level with the 2nd argument of
      # ERB.new is deprecated. Do not use it, and specify other arguments as
      # keyword arguments.
      # example.rb:1: warning: Passing trim_mode with the 3rd argument of
      # ERB.new is deprecated. Use keyword argument like
      # ERB.new(str, trim_mode:...) instead.
      # example.rb:1: warning: Passing eoutvar with the 4th argument of ERB.new
      # is deprecated. Use keyword argument like ERB.new(str, eoutvar: ...)
      # instead.
      #
      # Now non-keyword arguments other than first one are softly deprecated
      # and will be removed when Ruby 2.5 becomes EOL.
      # `ERB.new` with non-keyword arguments is deprecated since ERB 2.2.0.
      # Use `:trim_mode` and `:eoutvar` keyword arguments to `ERB.new`.
      # This cop identifies places where `ERB.new(str, trim_mode, eoutvar)` can
      # be replaced by `ERB.new(str, :trim_mode: trim_mode, eoutvar: eoutvar)`.
      #
      # @example
      #   # Target codes supports Ruby 2.6 and higher only
      #   # bad
      #   ERB.new(str, nil, '-', '@output_buffer')
      #
      #   # good
      #   ERB.new(str, trim_mode: '-', eoutvar: '@output_buffer')
      #
      #   # Target codes supports Ruby 2.5 and lower only
      #   # good
      #   ERB.new(str, nil, '-', '@output_buffer')
      #
      #   # Target codes supports Ruby 2.6, 2.5 and lower
      #   # bad
      #   ERB.new(str, nil, '-', '@output_buffer')
      #
      #   # good
      #   # Ruby standard library style
      #   # https://github.com/ruby/ruby/commit/3406c5d
      #   if ERB.instance_method(:initialize).parameters.assoc(:key) # Ruby 2.6+
      #     ERB.new(str, trim_mode: '-', eoutvar: '@output_buffer')
      #   else
      #     ERB.new(str, nil, '-', '@output_buffer')
      #   end
      #
      #   # good
      #   # Use `RUBY_VERSION` style
      #   if RUBY_VERSION >= '2.6'
      #     ERB.new(str, trim_mode: '-', eoutvar: '@output_buffer')
      #   else
      #     ERB.new(str, nil, '-', '@output_buffer')
      #   end
      #
      class ErbNewArguments < Cop
        extend TargetRubyVersion

        minimum_target_ruby_version 2.6

        MESSAGES = [
          'Passing safe_level with the 2nd argument of `ERB.new` is ' \
          'deprecated. Do not use it, and specify other arguments as ' \
          'keyword arguments.',
          'Passing trim_mode with the 3rd argument of `ERB.new` is ' \
          'deprecated. Use keyword argument like ' \
          '`ERB.new(str, trim_mode: %<arg_value>s)` instead.',
          'Passing eoutvar with the 4th argument of `ERB.new` is ' \
          'deprecated. Use keyword argument like ' \
          '`ERB.new(str, eoutvar: %<arg_value>s)` instead.'
        ].freeze

        def_node_matcher :erb_new_with_non_keyword_arguments, <<-PATTERN
          (send
            (const {nil? cbase} :ERB) :new $...)
        PATTERN

        def on_send(node)
          erb_new_with_non_keyword_arguments(node) do |arguments|
            return if correct_arguments?(arguments)

            1.upto(3) do |i|
              next if !arguments[i] || arguments[i].hash_type?

              message = format(MESSAGES[i - 1], arg_value: arguments[i].source)

              add_offense(
                node, location: arguments[i].source_range, message: message
              )
            end
          end
        end

        def correct_arguments?(arguments)
          arguments.size == 1 ||
            arguments.size == 2 && arguments[1].hash_type?
        end
      end
    end
  end
end
