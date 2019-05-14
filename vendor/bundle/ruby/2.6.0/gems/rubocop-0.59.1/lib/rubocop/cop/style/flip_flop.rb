# frozen_string_literal: true

module RuboCop
  module Cop
    module Style
      # This cop looks for uses of flip flop operator
      #
      # @example
      #   # bad
      #   (1..20).each do |x|
      #     puts x if (x == 5) .. (x == 10)
      #   end
      #
      #   # good
      #   (1..20).each do |x|
      #     puts x if (x >= 5) && (x <= 10)
      #   end
      class FlipFlop < Cop
        MSG = 'Avoid the use of flip flop operators.'.freeze

        def on_iflipflop(node)
          add_offense(node)
        end

        def on_eflipflop(node)
          add_offense(node)
        end
      end
    end
  end
end
