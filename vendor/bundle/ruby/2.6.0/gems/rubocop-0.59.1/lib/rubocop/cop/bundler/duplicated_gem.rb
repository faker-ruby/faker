# frozen_string_literal: true

module RuboCop
  module Cop
    module Bundler
      # A Gem's requirements should be listed only once in a Gemfile.
      # @example
      #   # bad
      #   gem 'rubocop'
      #   gem 'rubocop'
      #
      #   # bad
      #   group :development do
      #     gem 'rubocop'
      #   end
      #
      #   group :test do
      #     gem 'rubocop'
      #   end
      #
      #   # good
      #   group :development, :test do
      #     gem 'rubocop'
      #   end
      #
      #   # good
      #   gem 'rubocop', groups: [:development, :test]
      class DuplicatedGem < Cop
        include RangeHelp

        MSG = 'Gem `%<gem_name>s` requirements already given on line '\
          '%<line_of_first_occurrence>d of the Gemfile.'.freeze

        def investigate(processed_source)
          return if processed_source.blank?

          duplicated_gem_nodes.each do |nodes|
            nodes[1..-1].each do |node|
              register_offense(
                node,
                node.first_argument.to_a.first,
                nodes.first.first_line
              )
            end
          end
        end

        private

        def_node_search :gem_declarations, '(send nil? :gem str ...)'

        def duplicated_gem_nodes
          gem_declarations(processed_source.ast)
            .group_by(&:first_argument)
            .values
            .select { |nodes| nodes.size > 1 }
        end

        def register_offense(node, gem_name, line_of_first_occurrence)
          line_range = node.loc.column...node.loc.last_column
          offense_location =
            source_range(processed_source.buffer, node.first_line, line_range)
          message = format(
            MSG,
            gem_name: gem_name,
            line_of_first_occurrence: line_of_first_occurrence
          )
          add_offense(node, location: offense_location, message: message)
        end
      end
    end
  end
end
