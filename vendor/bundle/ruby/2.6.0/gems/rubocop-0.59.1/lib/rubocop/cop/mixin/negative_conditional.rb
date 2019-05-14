# frozen_string_literal: true

module RuboCop
  module Cop
    # Some common code shared between `NegatedIf` and
    # `NegatedWhile` cops.
    module NegativeConditional
      extend NodePattern::Macros

      MSG = 'Favor `%<inverse>s` over `%<current>s` for ' \
            'negative conditions.'.freeze

      private

      def_node_matcher :single_negative?, '(send !(send _ :!) :!)'
      def_node_matcher :empty_condition?, '(begin)'

      def check_negative_conditional(node)
        condition = node.condition

        return if empty_condition?(condition)

        condition = condition.children.last while condition.begin_type?

        return unless single_negative?(condition)
        return if node.if_type? && node.else?

        add_offense(node)
      end
    end
  end
end
