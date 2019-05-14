# frozen_string_literal: true

module RuboCop
  module Cop
    # Common functionality for checking length of code segments.
    module CodeLength
      include ConfigurableMax

      private

      def max_length
        cop_config['Max']
      end

      def count_comments?
        cop_config['CountComments']
      end

      def check_code_length(node)
        length = code_length(node)
        return unless length > max_length

        add_offense(node, message: message(length, max_length)) do
          self.max = length
        end
      end

      # Returns true for lines that shall not be included in the count.
      def irrelevant_line(source_line)
        source_line.blank? || !count_comments? && comment_line?(source_line)
      end
    end
  end
end
