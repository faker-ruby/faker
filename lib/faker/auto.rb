module Faker
  class Auto < Base
    class << self
      def vin
        self.regexify(/^[A-Z0-9]{3}[A-Z0-9]{5}[A-Z0-9]{1}[A-Z0-9]{1}[A-Z0-0]{1}[A-Z0-9]{1}\d{5}$/)
      end

      def mileage
        rand(10_000..90_000)
      end

      def year
        rand(1981..::Time.now.year)
      end

      def make
        translate('faker.auto.makes').sample
      end

      def model
        translate('faker.auto.models').sample
      end

      def style
        translate('faker.auto.styles').sample
      end

      def color
        translate('faker.auto.colors').sample
      end

      def transmission
        translate('faker.auto.transmissions').sample
      end

      def drive_type
        translate('faker.auto.drive_types').sample
      end

      def fuel_type
        translate('faker.auto.fuel_types').sample
      end

      def door_count
        "#{translate('faker.auto.door_count').sample} #{translate('faker.auto.door')}"
      end

      def car_type
        translate('faker.auto.car_types').sample
      end

      def engine
       "#{translate('faker.auto.engine_size').sample} #{translate('faker.auto.cylinder_engine')}"
      end

      alias :engine_size :engine

      def car_options
        translate('faker.auto.car_options').sample(rand(5..10))
      end

      def standard_specs
        translate('faker.auto.standard_specs').sample(rand(5..10))
      end
    end
  end
end