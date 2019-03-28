# frozen_string_literal: true

require_relative '../reflector'

module Faker
  module CLI
    module Reflectors
      # Find command reflector
      # @api private
      #
      class Search < Reflector
        attr_reader :query

        def self.call(query)
          new(query).call
        end

        def initialize(query)
          @query = query

          super
        end

        def call
          search_descendants_matching_query
          descendants_with_methods
        end

        private

        def search_descendants_matching_query
          faker_descendants.each do |descendant|
            methods = descendant.my_singleton_methods
            matching = methods.select { |method| query_matches?(method.to_s) }
            store(descendant, matching)
          end
        end

        def query_matches?(method_name)
          method_name_parts = method_name.split(/_/).reject(&:empty?)
          query.match(/#{method_name_parts.join('|')}/)
        end
      end
    end
  end
end
