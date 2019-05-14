# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop (by default) checks for uses of the lambda literal syntax for
      # single line lambdas, and the method call syntax for multiline lambdas.
      # It is configurable to enforce one of the styles for both single line
      # and multiline lambdas as well.
      #
      # @example EnforcedStyle: line_count_dependent (default)
      #   # bad
      #   f = lambda { |x| x }
      #   f = ->(x) do
      #         x
      #       end
      #
      #   # good
      #   f = ->(x) { x }
      #   f = lambda do |x|
      #         x
      #       end
      #
      # @example EnforcedStyle: lambda
      #   # bad
      #   f = ->(x) { x }
      #   f = ->(x) do
      #         x
      #       end
      #
      #   # good
      #   f = lambda { |x| x }
      #   f = lambda do |x|
      #         x
      #       end
      #
      # @example EnforcedStyle: literal
      #   # bad
      #   f = lambda { |x| x }
      #   f = lambda do |x|
      #         x
      #       end
      #
      #   # good
      #   f = ->(x) { x }
      #   f = ->(x) do
      #         x
      #       end
      class Lambda < Cop
        include ConfigurableEnforcedStyle

        LITERAL_MESSAGE = 'Use the `-> { ... }` lambda literal syntax for ' \
                          '%<modifier>s lambdas.'.freeze
        METHOD_MESSAGE = 'Use the `lambda` method for %<modifier>s ' \
                         'lambdas.'.freeze

        OFFENDING_SELECTORS = {
          style: {
            lambda: { single_line: '->', multiline: '->' },
            literal: { single_line: 'lambda', multiline: 'lambda' },
            line_count_dependent: { single_line: 'lambda', multiline: '->' }
          }
        }.freeze

        def_node_matcher :lambda_node?, '(block $(send nil? :lambda) ...)'

        def on_block(node)
          return unless node.lambda?

          selector = node.send_node.source

          return unless offending_selector?(node, selector)

          add_offense(node,
                      location: node.send_node.source_range,
                      message: message(node, selector))
        end

        def autocorrect(node)
          block_method, _args = *node
          selector = block_method.source

          # Don't autocorrect if this would change the meaning of the code
          return if selector == '->' && arg_to_unparenthesized_call?(node)

          lambda do |corrector|
            if selector == 'lambda'
              autocorrect_method_to_literal(corrector, node)
            else
              autocorrect_literal_to_method(corrector, node)
            end
          end
        end

        private

        def offending_selector?(node, selector)
          lines = node.multiline? ? :multiline : :single_line

          selector == OFFENDING_SELECTORS[:style][style][lines]
        end

        def message(node, selector)
          message = selector == '->' ? METHOD_MESSAGE : LITERAL_MESSAGE

          format(message, modifier: message_line_modifier(node))
        end

        def message_line_modifier(node)
          case style
          when :line_count_dependent
            node.multiline? ? 'multiline' : 'single line'
          else
            'all'
          end
        end

        def autocorrect_literal_to_method(corrector, node)
          block_method, args = *node

          # Check for unparenthesized args' preceding and trailing whitespaces.
          remove_unparenthesized_whitespace(corrector, node)

          # Avoid correcting to `lambdado` by inserting whitespace
          # if none exists before or after the lambda arguments.
          if needs_whitespace?(block_method, args, node)
            corrector.insert_before(node.loc.begin, ' ')
          end
          corrector.replace(block_method.source_range, 'lambda')
          corrector.remove(args.source_range) if args.source_range
          return if args.children.empty?

          arg_str = " |#{lambda_arg_string(args)}|"
          corrector.insert_after(node.loc.begin, arg_str)
        end

        def autocorrect_method_to_literal(corrector, node)
          block_method, args = *node
          corrector.replace(block_method.source_range, '->')
          return if args.children.empty?

          arg_str = "(#{lambda_arg_string(args)})"
          whitespace_and_old_args = node.loc.begin.end.join(args.loc.end)
          corrector.insert_after(block_method.source_range, arg_str)
          corrector.remove(whitespace_and_old_args)
        end

        def needs_whitespace?(block_method, args, node)
          selector_end = block_method.loc.selector.end.end_pos
          block_begin  = node.loc.begin.begin_pos

          (block_begin == end_pos(args) && selector_end == begin_pos(args)) ||
            (block_begin == selector_end)
        end

        def begin_pos(node)
          node.loc.begin && node.loc.begin.begin_pos
        end

        def end_pos(node)
          node.loc.end && node.loc.end.end_pos
        end

        def lambda_arg_string(args)
          args.children.map(&:source).join(', ')
        end

        def arg_to_unparenthesized_call?(arg_node)
          parent = arg_node.parent

          if parent && parent.pair_type?
            arg_node = parent.parent
            parent = arg_node.parent
          end

          return false unless parent && parent.send_type?
          return false if parent.parenthesized_call?

          arg_node.sibling_index > 1
        end

        def remove_unparenthesized_whitespace(corrector, node)
          args = node.arguments

          return unless unparenthesized_literal_args?(args)

          remove_leading_whitespace(node, corrector)
          remove_trailing_whitespace(node, corrector)
        end

        def remove_leading_whitespace(node, corrector)
          corrector.remove_preceding(
            node.arguments.source_range,
            node.arguments.source_range.begin_pos -
              node.send_node.source_range.end_pos
          )
        end

        def remove_trailing_whitespace(node, corrector)
          corrector.remove_preceding(
            node.loc.begin,
            node.loc.begin.begin_pos - node.arguments.source_range.end_pos - 1
          )
        end

        def unparenthesized_literal_args?(args)
          args.source_range && args.source_range.begin && !parentheses?(args)
        end
      end
    end
  end
end
