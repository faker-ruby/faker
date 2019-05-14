# frozen_string_literal: true

module RuboCop
  module Cop
    # Common functionality for Bundler/OrderedGems and
    # Gemspec/OrderedDependencies.
    module OrderedGemNode
      private

      def get_source_range(node, comments_as_separators)
        unless comments_as_separators
          first_comment = processed_source.ast_with_comments[node].first
          return first_comment.loc.expression unless first_comment.nil?
        end
        node.source_range
      end

      def case_insensitive_out_of_order?(string_a, string_b)
        string_a.downcase < string_b.downcase
      end

      def consecutive_lines(previous, current)
        first_line = get_source_range(
          current,
          treat_comments_as_separators
        ).first_line
        previous.source_range.last_line == first_line - 1
      end

      def register_offense(previous, current)
        message = format(
          self.class::MSG,
          previous: gem_name(current),
          current: gem_name(previous)
        )
        add_offense(current, message: message)
      end

      def gem_name(declaration_node)
        gem_node = declaration_node.first_argument

        find_gem_name(gem_node)
      end

      def find_gem_name(gem_node)
        return gem_node.str_content if gem_node.str_type?

        find_gem_name(gem_node.receiver)
      end

      def treat_comments_as_separators
        cop_config['TreatCommentsAsGroupSeparators']
      end
    end
  end
end
