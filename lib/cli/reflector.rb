# frozen_string_literal: true

require 'faker'

module Faker
  module CLI
    # Abstract `Faker` Reflector - introspects the `Faker` module
    #
    # @api private
    # @abstract
    #
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

      attr_reader :descendants_with_methods

      def initialize(*)
        @descendants_with_methods = Hash.new { |h, k| h[k] = [] }
      end

      protected

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
