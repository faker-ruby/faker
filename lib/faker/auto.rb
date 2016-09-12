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
        rand(2005..::Time.now.year)
      end

      def make
        fetch('auto.makes')
      end

      def model(_make = '')
        return fetch('auto.models_by_make').values.flatten.sample if _make.empty?
        fetch('auto.models_by_make.' + _make)
      end

      def make_and_model
        m = make
        "#{m} #{model(m)}"
      end

      def style
        fetch('auto.styles')
      end

      def color
        fetch('auto.colors')
      end

      def transmission
        fetch('auto.transmissions')
      end

      def drive_type
        fetch('auto.drive_types')
      end

      def fuel_type
        fetch('auto.fuel_types')
      end

      def door_count
        "#{fetch('auto.door_count')} #{fetch('auto.door')}"
      end

      def car_type
        fetch('auto.car_types')
      end

      def engine
       "#{fetch('auto.engine_size')} #{fetch('auto.cylinder_engine')}"
      end
      alias :engine_size :engine

      def car_options
        rand(5...10).times.map { fetch('auto.car_options') }
      end

      def standard_specs
        rand(5...10).times.map { fetch('auto.standard_specs') }
      end
    end
  end
end
