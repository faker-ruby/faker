# frozen_string_literal: true

module Faker
  class Aircraft < Base
    class << self
      def manufacturer
        fetch('aircraft.manufacturer')
      end

      def model(manufacturer_of_model = '')
        manufacturer_of_model = manufacturer if manufacturer_of_model.empty?
        fetch("aircraft.model_by_manufacturer.#{manufacturer_of_model}")
      end

      def prefix
        regexify(bothify(fetch('aircraft.prefix')))
      end
    end
  end
end
