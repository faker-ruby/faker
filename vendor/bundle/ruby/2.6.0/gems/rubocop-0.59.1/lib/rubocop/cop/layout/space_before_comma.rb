# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # Checks for comma (,) preceded by space.
      #
      # @example
      #   # bad
      #   [1 , 2 , 3]
      #   a(1 , 2)
      #   each { |a , b| }
      #
      #   # good
      #   [1, 2, 3]
      #   a(1, 2)
      #   each { |a, b| }
      class SpaceBeforeComma < Cop
        include SpaceBeforePunctuation

        def autocorrect(space)
          PunctuationCorrector.remove_space(space)
        end

        def kind(token)
          'comma' if token.comma?
        end
      end
    end
  end
end
