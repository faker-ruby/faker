# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # TODO: Make configurable.
      # Checks for uses of if/then/else/end on a single line.
      #
      # @example
      #   # bad
      #   if foo then boo else doo end
      #   unless foo then boo else goo end
      #
      #   # good
      #   foo ? boo : doo
      #   boo if foo
      #   if foo then boo end
      #
      #   # good
      #   if foo
      #     boo
      #   else
      #     doo
      #   end
      class OneLineConditional < Cop
        include OnNormalIfUnless

        MSG = 'Favor the ternary operator (`?:`) ' \
              'over `%<keyword>s/then/else/end` constructs.'.freeze

        def on_normal_if_unless(node)
          return unless node.single_line? && node.else_branch

          add_offense(node)
        end

        def autocorrect(node)
          lambda do |corrector|
            corrector.replace(node.source_range, replacement(node))
          end
        end

        private

        def message(node)
          format(MSG, keyword: node.keyword)
        end

        def replacement(node)
          return to_ternary(node) unless node.parent

          if %i[and or].include?(node.parent.type)
            return "(#{to_ternary(node)})"
          end

          if node.parent.send_type? && operator?(node.parent.method_name)
            return "(#{to_ternary(node)})"
          end

          to_ternary(node)
        end

        def to_ternary(node)
          cond, body, else_clause = *node
          "#{expr_replacement(cond)} ? #{expr_replacement(body)} : " \
            "#{expr_replacement(else_clause)}"
        end

        def expr_replacement(node)
          requires_parentheses?(node) ? "(#{node.source})" : node.source
        end

        def requires_parentheses?(node)
          return true if %i[and or if].include?(node.type)
          return true if node.assignment?
          return true if method_call_with_changed_precedence?(node)

          keyword_with_changed_precedence?(node)
        end

        def method_call_with_changed_precedence?(node)
          return false unless node.send_type? && node.arguments?
          return false if node.parenthesized_call?

          !operator?(node.method_name)
        end

        def keyword_with_changed_precedence?(node)
          return false unless node.keyword?
          return true if node.prefix_not?

          !node.parenthesized_call?
        end
      end
    end
  end
end
