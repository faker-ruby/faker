# frozen_string_literal: true

module RuboCop
  module Cop
    # Functions for checking the alignment of the `end` keyword.
    module EndKeywordAlignment
      include ConfigurableEnforcedStyle

      BYTE_ORDER_MARK = 0xfeff # The Unicode codepoint

      MSG = '`end` at %<end_line>d, %<end_col>d is not aligned with ' \
            '`%<source>s` at %<align_line>d, %<align_col>d.'.freeze

      private

      def check_end_kw_in_node(node)
        check_end_kw_alignment(node, style => node.loc.keyword)
      end

      def check_end_kw_alignment(node, align_ranges)
        return if ignored_node?(node)

        end_loc = node.loc.end
        return unless end_loc # Discard modifier forms of if/while/until.

        matching = matching_ranges(end_loc, align_ranges)

        if matching.key?(style)
          correct_style_detected
        else
          add_offense_for_misalignment(node, align_ranges[style])
          style_detected(matching.keys)
        end
      end

      def matching_ranges(end_loc, align_ranges)
        align_ranges.select do |_, range|
          range.line == end_loc.line ||
            effective_column(range) == end_loc.column
        end
      end

      def add_offense_for_misalignment(node, align_with)
        end_loc = node.loc.end
        msg = format(MSG, end_line: end_loc.line,
                          end_col: end_loc.column,
                          source: align_with.source,
                          align_line: align_with.line,
                          align_col: align_with.column)
        add_offense(node, location: end_loc, message: msg)
      end

      def style_parameter_name
        'EnforcedStyleAlignWith'
      end

      def variable_alignment?(whole_expression, rhs, end_alignment_style)
        case end_alignment_style
        when :variable
          !line_break_before_keyword?(whole_expression, rhs)
        when :start_of_line
          true
        end
      end

      def line_break_before_keyword?(whole_expression, rhs)
        rhs.first_line > whole_expression.line
      end

      # Returns the column attribute of the range, except if the range is on
      # the first line and there's a byte order mark at the beginning of that
      # line, in which case 1 is subtracted from the column value. This gives
      # the column as it appears when viewing the file in an editor.
      def effective_column(range)
        if range.line == 1 &&
           @processed_source.raw_source.codepoints.first == BYTE_ORDER_MARK
          range.column - 1
        else
          range.column
        end
      end
    end
  end
end
