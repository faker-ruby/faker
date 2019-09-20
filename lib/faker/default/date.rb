# frozen_string_literal: true

module Faker
  class Date < Base
    class << self
      def between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from:, to:)
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
          keywords << :to if legacy_to != NOT_GIVEN
        end

        from = get_date_object(from)
        to   = get_date_object(to)

        Faker::Base.rand_in_range(from, to)
      end

      # rubocop:disable Metrics/ParameterLists
      def between_except(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_excepted = NOT_GIVEN, from:, to:, excepted:)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :from if legacy_from != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :to if legacy_to != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :excepted if legacy_excepted != NOT_GIVEN
        end

        raise ArgumentError, 'From date, to date and excepted date must not be the same' if from == to && to == excepted

        excepted = get_date_object(excepted)

        loop do
          date = between(from: from, to: to)
          break date.to_date if date != excepted
        end
      end

      def forward(legacy_days = NOT_GIVEN, days: 365)
        warn_for_deprecated_arguments do |keywords|
          keywords << :days if legacy_days != NOT_GIVEN
        end

        from = ::Date.today + 1
        to   = ::Date.today + days

        between(from: from, to: to).to_date
      end

      def backward(legacy_days = NOT_GIVEN, days: 365)
        warn_for_deprecated_arguments do |keywords|
          keywords << :days if legacy_days != NOT_GIVEN
        end

        from = ::Date.today - days
        to   = ::Date.today - 1

        between(from: from, to: to).to_date
      end

      def birthday(legacy_min_age = NOT_GIVEN, legacy_max_age = NOT_GIVEN, min_age: 18, max_age: 65)
        warn_for_deprecated_arguments do |keywords|
          keywords << :min_age if legacy_min_age != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :max_age if legacy_max_age != NOT_GIVEN
        end

        t = ::Date.today

        from = birthday_date(t, max_age)
        to   = birthday_date(t, min_age)

        between(from: from, to: to).to_date
      end

      private

      def birthday_date(date, age)
        year = date.year - age

        day =
          if date.day == 29 && date.month == 2 && !::Date.leap?(year)
            28
          else
            date.day
          end

        ::Date.new(year, date.month, day)
      end

      def get_date_object(date)
        date = ::Date.parse(date) if date.is_a?(::String)
        date = date.to_date if date.respond_to?(:to_date)
        date
      end
    end
  end
end
