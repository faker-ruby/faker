# frozen_string_literal: true

module RuboCop
  module Cop
    module Layout
      # This cops checks for indentation of the first non-blank non-comment
      # line in a file.
      #
      # @example
      #   # bad
      #      class A
      #        def foo; end
      #      end
      #
      #   # good
      #   class A
      #     def foo; end
      #   end
      #
      class InitialIndentation < Cop
        include RangeHelp

        MSG = 'Indentation of first line in file detected.'.freeze

        def investigate(_processed_source)
          space_before(first_token) do |space|
            add_offense(space, location: first_token.pos)
          end
        end

        def autocorrect(range)
          ->(corrector) { corrector.remove(range) }
        end

        private

        def first_token
          processed_source.find_token { |t| !t.text.start_with?('#') }
        end

        def space_before(token)
          return unless token
          return if token.column.zero?

          space_range =
            range_with_surrounding_space(range: token.pos,
                                         side: :left,
                                         newlines: false)
          # If the file starts with a byte order mark (BOM), the column can be
          # non-zero, but then we find out here if there's no space to the left
          # of the first token.
          return if space_range == token.pos

          yield range_between(space_range.begin_pos, token.begin_pos)
        end
      end
    end
  end
end
