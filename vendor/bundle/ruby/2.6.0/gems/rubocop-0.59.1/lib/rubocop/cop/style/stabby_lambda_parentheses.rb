# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # Check for parentheses around stabby lambda arguments.
      # There are two different styles. Defaults to `require_parentheses`.
      #
      # @example EnforcedStyle: require_parentheses (default)
      #   # bad
      #   ->a,b,c { a + b + c }
      #
      #   # good
      #   ->(a,b,c) { a + b + c}
      #
      # @example EnforcedStyle: require_no_parentheses
      #   # bad
      #   ->(a,b,c) { a + b + c }
      #
      #   # good
      #   ->a,b,c { a + b + c}
      class StabbyLambdaParentheses < Cop
        include ConfigurableEnforcedStyle

        MSG_REQUIRE = 'Wrap stabby lambda arguments with parentheses.'.freeze
        MSG_NO_REQUIRE = 'Do not wrap stabby lambda arguments ' \
                         'with parentheses.'.freeze
        def on_send(node)
          return unless stabby_lambda_with_args?(node)
          return unless redundant_parentheses?(node) ||
                        missing_parentheses?(node)

          add_offense(node.block_node.arguments)
        end

        def autocorrect(node)
          if style == :require_parentheses
            missing_parentheses_corrector(node)
          elsif style == :require_no_parentheses
            unwanted_parentheses_corrector(node)
          end
        end

        private

        def missing_parentheses?(node)
          style == :require_parentheses && !parentheses?(node)
        end

        def redundant_parentheses?(node)
          style == :require_no_parentheses && parentheses?(node)
        end

        def message(_node)
          style == :require_parentheses ? MSG_REQUIRE : MSG_NO_REQUIRE
        end

        def missing_parentheses_corrector(node)
          lambda do |corrector|
            args_loc = node.loc.expression

            corrector.insert_before(args_loc, '(')
            corrector.insert_after(args_loc, ')')
          end
        end

        def unwanted_parentheses_corrector(node)
          lambda do |corrector|
            args_loc = node.loc

            corrector.replace(args_loc.begin, '')
            corrector.remove(args_loc.end)
          end
        end

        def stabby_lambda_with_args?(node)
          node.lambda_literal? && node.block_node.arguments?
        end

        def parentheses?(node)
          node.block_node.arguments.loc.begin
        end
      end
    end
  end
end
