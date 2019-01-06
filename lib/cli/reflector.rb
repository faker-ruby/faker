# frozen_string_literal: true

require 'faker'

module Faker
  module CLI
    # Exposes `Faker` reflection methods
    # @api private
    class Reflector
      Faker::Base.class_eval do
        # Select `Faker` subclasses
        # @return [Array] `Faker::Base` sub classes
        def self.descendants
          @descendants ||= ObjectSpace.each_object(Class).select do |klass|
            klass < self
          end
        end

        # Select public class methods
        # @return [Array] public methods
        def self.my_singleton_methods
          singleton_methods(false).select { |m| respond_to?(m) }
        end
      end

      attr_reader :descendants_with_methods, :query

      def initialize(query = nil)
        @descendants_with_methods = Hash.new { |h, k| h[k] = [] }
        @query = query
      end

      class << self
        def find(query)
          new(query).find
        end

        def list(show_methods: false)
          new.list(show_methods)
        end
      end

      def find
        search_descendants_matching_query
        descendants_with_methods
      end

      def list(show_methods)
        show_methods ? all_descendants_with_methods : faker_descendants
      end

      private

      def all_descendants_with_methods
        faker_descendants.each do |descendant|
          store(descendant, descendant.my_singleton_methods)
        end
        descendants_with_methods
      end

      def search_descendants_matching_query
        faker_descendants.each do |descendant|
          methods = descendant.my_singleton_methods
          matching = methods.select { |m| query_matches?(m.to_s) }
          store(descendant, matching)
        end
      end

      def query_matches?(method_name)
        method_name_parts = method_name.split(/_/).reject(&:empty?)
        query.match(/#{method_name_parts.join('|')}/)
      end

      def store(descendant, methods)
        return if methods.empty?

        descendants_with_methods[descendant].concat(methods)
      end

      def faker_descendants
        @faker_descendants ||= Faker::Base.descendants
      end
    end
  end
end
