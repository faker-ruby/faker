# frozen_string_literal: true

module RuboCop
  module Cop
    # This class does condition auto-correction
    class ConditionCorrector
      class << self
        def correct_negative_condition(node)
          condition = negated_condition(node)

          lambda do |corrector|
            corrector.replace(node.loc.keyword, node.inverse_keyword)
            corrector.replace(condition.source_range,
                              condition.children.first.source)
          end
        end

        private

        def negated_condition(node)
          condition = node.condition
          condition = condition.children.first while condition.begin_type?
          condition
        end
      end
    end
  end
end
