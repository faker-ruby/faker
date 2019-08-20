# frozen_string_literal: true

module Faker
  class Time < Base
    TIME_RANGES = {
      all: (0..23),
      day: (9..17),
      night: (18..23),
      morning: (6..11),
      afternoon: (12..17),
      evening: (17..21),
      midnight: (0..4)
    }.freeze

    class << self
      # rubocop:disable Metrics/ParameterLists
      def between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_format = NOT_GIVEN, from:, to:, format: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Time.between` is deprecated. Use keyword argument like `Time.between(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Time.between` is deprecated. Use keyword argument like `Time.between(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 3rd argument of `Time.between` is deprecated. Use keyword argument like `Time.between(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end

        from = get_time_object(from)
        to = get_time_object(to)

        time = Faker::Base.rand_in_range(from, to)
        time_with_format(time, format)
      end

      # rubocop:disable Metrics/ParameterLists
      def between_dates(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, from:, to:, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Time.between_dates` is deprecated. Use keyword argument like `Time.between_dates(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Time.between_dates` is deprecated. Use keyword argument like `Time.between_dates(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end
        if legacy_period != NOT_GIVEN
          warn_with_uplevel 'Passing `period` with the 3rd argument of `Time.between_dates` is deprecated. Use keyword argument like `Time.between_dates(period: ...)` instead.', uplevel: 1
          period = legacy_period
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 4th argument of `Time.between_dates` is deprecated. Use keyword argument like `Time.between_dates(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end

        date = Faker::Date.between(from: from, to: to)
        time = date_with_random_time(date, period)
        time_with_format(time, format)
      end

      # rubocop:disable Metrics/ParameterLists
      def forward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_days != NOT_GIVEN
          warn_with_uplevel 'Passing `days` with the 1st argument of `Time.forward` is deprecated. Use keyword argument like `Time.forward(days: ...)` instead.', uplevel: 1
          days = legacy_days
        end
        if legacy_period != NOT_GIVEN
          warn_with_uplevel 'Passing `period` with the 2nd argument of `Time.forward` is deprecated. Use keyword argument like `Time.forward(period: ...)` instead.', uplevel: 1
          period = legacy_period
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 3rd argument of `Time.forward` is deprecated. Use keyword argument like `Time.forward(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end

        time_with_format(date_with_random_time(Faker::Date.forward(days: days), period), format)
      end

      # rubocop:disable Metrics/ParameterLists
      def backward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        if legacy_days != NOT_GIVEN
          warn_with_uplevel 'Passing `days` with the 1st argument of `Time.backward` is deprecated. Use keyword argument like `Time.backward(days: ...)` instead.', uplevel: 1
          days = legacy_days
        end
        if legacy_period != NOT_GIVEN
          warn_with_uplevel 'Passing `period` with the 2nd argument of `Time.backward` is deprecated. Use keyword argument like `Time.backward(period: ...)` instead.', uplevel: 1
          period = legacy_period
        end
        if legacy_format != NOT_GIVEN
          warn_with_uplevel 'Passing `format` with the 3rd argument of `Time.backward` is deprecated. Use keyword argument like `Time.backward(format: ...)` instead.', uplevel: 1
          format = legacy_format
        end

        time_with_format(date_with_random_time(Faker::Date.backward(days: days), period), format)
      end

      private

      def date_with_random_time(date, period)
        ::Time.local(date.year, date.month, date.day, hours(period), minutes, seconds)
      end

      def time_with_format(time, format)
        format.nil? ? time : I18n.localize(time, format: format)
      end

      def hours(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.key? period

        sample(TIME_RANGES[period].to_a)
      end

      def minutes
        seconds
      end

      def seconds
        sample((0..59).to_a)
      end

      def get_time_object(time)
        time = ::Time.parse(time) if time.is_a? String
        time = time.to_time if time.respond_to?(:to_time)
        time
      end
    end
  end
end
