# frozen_string_literal: true

module Faker
  class Measurement < Base
    class << self
      ALL = 'all'
      NONE = 'none'

      def height(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.height` is deprecated. Use keyword argument like `Measurement.height(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'height')
      end

      def length(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.length` is deprecated. Use keyword argument like `Measurement.length(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'length')
      end

      def volume(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.volume` is deprecated. Use keyword argument like `Measurement.volume(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'volume')
      end

      def weight(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.weight` is deprecated. Use keyword argument like `Measurement.weight(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'weight')
      end

      def metric_height(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.metric_height` is deprecated. Use keyword argument like `Measurement.metric_height(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'metric_height')
      end

      def metric_length(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.metric_length` is deprecated. Use keyword argument like `Measurement.metric_length(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'metric_length')
      end

      def metric_volume(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.metric_volume` is deprecated. Use keyword argument like `Measurement.metric_volume(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'metric_volume')
      end

      def metric_weight(legacy_amount = NOT_GIVEN, amount: rand(10))
        if legacy_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `amount` with the 1st argument of `Measurement.metric_weight` is deprecated. Use keyword argument like `Measurement.metric_weight(amount: ...)` instead.', uplevel: 1
          amount = legacy_amount
        end

        define_measurement_locale(amount, 'metric_weight')
      end

      private

      def check_for_plural(text, number)
        if number && number != 1
          make_plural(text)
        else
          text
        end
      end

      def define_measurement_locale(amount, locale)
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch("measurement.#{locale}"))
        elsif amount == NONE
          fetch("measurement.#{locale}")
        else
          locale = check_for_plural(fetch("measurement.#{locale}"), amount)

          "#{amount} #{locale}"
        end
      end

      def ensure_valid_amount(amount)
        raise ArgumentError, 'invalid amount' unless amount == NONE || amount == ALL || amount.is_a?(Integer) || amount.is_a?(Float)
      end

      def make_plural(text)
        case text
        when 'foot'
          'feet'
        when 'inch'
          'inches'
        when 'fluid ounce'
          'fluid ounces'
        when 'metric ton'
          'metric tons'
        else
          "#{text}s"
        end
      end
    end
  end
end
