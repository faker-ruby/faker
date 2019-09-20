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
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
        end

        from = get_time_object(from)
        to = get_time_object(to)

        time = Faker::Base.rand_in_range(from, to)
        time_with_format(time, format)
      end

      # rubocop:disable Metrics/ParameterLists
      def between_dates(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, from:, to:, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
          keywords << :period if legacy_period != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
        end

        date = Faker::Date.between(from: from, to: to)
        time = date_with_random_time(date, period)
        time_with_format(time, format)
      end

      # rubocop:disable Metrics/ParameterLists
      def forward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :days if legacy_days != NOT_GIVEN
          keywords << :period if legacy_period != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
        end

        time_with_format(date_with_random_time(Faker::Date.forward(days: days), period), format)
      end

      # rubocop:disable Metrics/ParameterLists
      def backward(legacy_days = NOT_GIVEN, legacy_period = NOT_GIVEN, legacy_format = NOT_GIVEN, days: 365, period: :all, format: nil)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :days if legacy_days != NOT_GIVEN
          keywords << :period if legacy_period != NOT_GIVEN
          keywords << :format if legacy_format != NOT_GIVEN
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
