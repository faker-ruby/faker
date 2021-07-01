# frozen_string_literal: true

module Faker
  class Science < Base
    class << self
      ##
      # Produces the name of a element.
      #
      # @return [String]
      #
      # @example
      #   Faker::Science.element #=> "Carbon"
      #
      # @faker.version 1.8.5
      def element
        fetch('science.element')
      end

      ##
      # Produces the symbol of an element.
      #
      # @return [String]
      #
      # @example
      #   Faker::Science.element_symbol #=> "Pb"
      #
      # @faker.version 1.9.0
      def element_symbol
        fetch('science.element_symbol')
      end

      ##
      # Produces the state of an element.
      #
      # @return [String]
      #
      # @example
      #   Faker::Science.element_state #=> "Liquid"
      #
      # @faker.version next
      def element_state
        fetch('science.element_state')
      end

      ##
      # Produces the subcategory of an element.
      #
      # @return [String]
      #
      # @example
      #   Faker::Science.element_subcategory #=> "Reactive nonmetal"
      #
      # @faker.version next
      def element_subcategory
        fetch('science.element_subcategory')
      end

      ##
      # Produces the name of a scientist.
      #
      # @return [String]
      #
      # @example
      #   Faker::Science.scientist #=> "Isaac Newton"
      #
      # @faker.version 1.8.5
      def scientist
        fetch('science.scientist')
      end
    end
  end
end
