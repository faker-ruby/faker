# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      # This cop checks for literals used as the conditions or as
      # operands in and/or expressions serving as the conditions of
      # if/while/until.
      #
      # @example
      #
      #   # bad
      #
      #   if 20
      #     do_something
      #   end
      #
      # @example
      #
      #   # bad
      #
      #   if some_var && true
      #     do_something
      #   end
      #
      # @example
      #
      #   # good
      #
      #   if some_var && some_condition
      #     do_something
      #   end
      class LiteralAsCondition < Cop
        MSG = 'Literal `%<literal>s` appeared as a condition.'.freeze

        def on_if(node)
          check_for_literal(node)
        end

        def on_while(node)
          check_for_literal(node)
        end

        def on_while_post(node)
          check_for_literal(node)
        end

        def on_until(node)
          check_for_literal(node)
        end

        def on_until_post(node)
          check_for_literal(node)
        end

        def on_case(case_node)
          if case_node.condition
            check_case(case_node)
          else
            case_node.each_when do |when_node|
              next unless when_node.conditions.all?(&:literal?)

              add_offense(when_node)
            end
          end
        end

        def on_send(node)
          return unless node.negation_method?

          check_for_literal(node)
        end

        def message(node)
          format(MSG, literal: node.source)
        end

        private

        def check_for_literal(node)
          cond = condition(node)
          if cond.literal?
            add_offense(cond)
          else
            check_node(cond)
          end
        end

        def basic_literal?(node)
          if node.array_type?
            primitive_array?(node)
          else
            node.basic_literal?
          end
        end

        def primitive_array?(node)
          node.children.all? { |n| basic_literal?(n) }
        end

        def check_node(node)
          if node.send_type? && node.prefix_bang?
            handle_node(node.receiver)
          elsif LOGICAL_OPERATOR_NODES.include?(node.type)
            node.each_child_node { |op| handle_node(op) }
          elsif node.begin_type? && node.children.one?
            handle_node(node.children.first)
          end
        end

        def handle_node(node)
          if node.literal?
            add_offense(node)
          elsif %i[send and or begin].include?(node.type)
            check_node(node)
          end
        end

        def check_case(case_node)
          condition = case_node.condition

          return if condition.array_type? && !primitive_array?(condition)
          return if condition.dstr_type?

          handle_node(condition)
        end

        def condition(node)
          if node.send_type?
            node.receiver
          else
            node.condition
          end
        end
      end
    end
  end
end
