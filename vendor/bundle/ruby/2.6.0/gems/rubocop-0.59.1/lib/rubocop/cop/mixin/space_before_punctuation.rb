# frozen_string_literal: true

module RuboCop
  module Cop
    # Common functionality for cops checking for space before
    # punctuation.
    module SpaceBeforePunctuation
      include RangeHelp

      MSG = 'Space found before %<token>s.'.freeze

      def investigate(processed_source)
        each_missing_space(processed_source.tokens) do |token, pos_before|
          add_offense(pos_before, location: pos_before,
                                  message: format(MSG, token: kind(token)))
        end
      end

      private

      def each_missing_space(tokens)
        tokens.each_cons(2) do |token1, token2|
          next unless kind(token2)
          next unless space_missing?(token1, token2)
          next if space_required_after?(token1)

          pos_before_punctuation = range_between(token1.end_pos,
                                                 token2.begin_pos)

          yield token2, pos_before_punctuation
        end
      end

      def space_missing?(token1, token2)
        token1.line == token2.line && token2.begin_pos > token1.end_pos
      end

      def space_required_after?(token)
        token.left_curly_brace? && space_required_after_lcurly?
      end

      def space_required_after_lcurly?
        cfg = config.for_cop('Layout/SpaceInsideBlockBraces')
        style = cfg['EnforcedStyle'] || 'space'
        style == 'space'
      end
    end
  end
end
