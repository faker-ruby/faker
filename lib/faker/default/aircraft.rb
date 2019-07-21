# frozen_string_literal: true

module Faker
  class Aircraft < Base
    class << self
      #  Generates random aircraft manufacturer
      #
      # @return [String] a manufacturer of aircrafts
      def manufacturer
        fetch('aircraft.manufacturer')
      end

      # Generates a random model of aircraft based on a manufacturer
      #
      # @param [String] manufacturer_of_model The specific manufacturer
      # Uses a random manufacturer if not provided
      #
      # @return [String] a model of aircraft
      def model(manufacturer_of_model = '')
        manufacturer_of_model = manufacturer if manufacturer_of_model.empty?
        fetch("aircraft.model_by_manufacturer.#{manufacturer_of_model}")
      end

      # Generates a random aircraft prefix
      #
      # @return [String] a prefix
      def prefix
        regexify(bothify(fetch('aircraft.prefix')))
      end

      # Generates a random airline name
      #
      # @return [String] an airline
      def airline
        fetch('aircraft.airline')
      end
    end
  end
end
