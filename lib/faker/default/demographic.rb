# frozen_string_literal: true

module Faker
  class Demographic < Base
    class << self
      def race
        fetch('demographic.race')
      end

      def educational_attainment
        fetch('demographic.educational_attainment')
      end

      def demonym
        fetch('demographic.demonym')
      end

      def marital_status
        fetch('demographic.marital_status')
      end

      def sex
        fetch('demographic.sex')
      end

      def height(legacy_unit = NOT_GIVEN, unit: :metric)
        if legacy_unit != NOT_GIVEN
          warn_with_uplevel 'Passing `unit` with the 1st argument of `Demographic.height` is deprecated. Use keyword argument like `Demographic.height(unit: ...)` instead.', uplevel: 1
          unit = legacy_unit
        end

        case unit
        when :imperial
          inches = rand_in_range(57, 86)
          "#{inches / 12} ft, #{inches % 12} in"
        when :metric
          rand_in_range(1.45, 2.13).round(2).to_s
        end
      end
    end
  end
end
