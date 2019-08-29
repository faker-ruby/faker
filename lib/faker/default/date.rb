# frozen_string_literal: true

module Faker
  class Date < Base
    class << self
      def between(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, from:, to:)
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Date.between` is deprecated. Use keyword argument like `Date.between(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Date.between` is deprecated. Use keyword argument like `Date.between(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end

        from = get_date_object(from)
        to   = get_date_object(to)

        Faker::Base.rand_in_range(from, to)
      end

      # rubocop:disable Metrics/ParameterLists
      def between_except(legacy_from = NOT_GIVEN, legacy_to = NOT_GIVEN, legacy_excepted = NOT_GIVEN, from:, to:, excepted:)
        # rubocop:enable Metrics/ParameterLists
        if legacy_from != NOT_GIVEN
          warn_with_uplevel 'Passing `from` with the 1st argument of `Date.between_except` is deprecated. Use keyword argument like `Date.between_except(from: ...)` instead.', uplevel: 1
          from = legacy_from
        end
        if legacy_to != NOT_GIVEN
          warn_with_uplevel 'Passing `to` with the 2nd argument of `Date.between_except` is deprecated. Use keyword argument like `Date.between_except(to: ...)` instead.', uplevel: 1
          to = legacy_to
        end
        if legacy_excepted != NOT_GIVEN
          warn_with_uplevel 'Passing `excepted` with the 3rd argument of `Date.between_except` is deprecated. Use keyword argument like `Date.between_except(excepted: ...)` instead.', uplevel: 1
          excepted = legacy_excepted
        end

        raise ArgumentError, 'From date, to date and excepted date must not be the same' if from == to && to == excepted

        excepted = get_date_object(excepted)

        loop do
          date = between(from: from, to: to)
          break date.to_date if date != excepted
        end
      end

      def forward(legacy_days = NOT_GIVEN, days: 365)
        if legacy_days != NOT_GIVEN
          warn_with_uplevel 'Passing `days` with the 1st argument of `Date.forward` is deprecated. Use keyword argument like `Date.forward(days: ...)` instead.', uplevel: 1
          days = legacy_days
        end

        from = ::Date.today + 1
        to   = ::Date.today + days

        between(from: from, to: to).to_date
      end

      def backward(legacy_days = NOT_GIVEN, days: 365)
        if legacy_days != NOT_GIVEN
          warn_with_uplevel 'Passing `days` with the 1st argument of `Date.backward` is deprecated. Use keyword argument like `Date.backward(days: ...)` instead.', uplevel: 1
          days = legacy_days
        end

        from = ::Date.today - days
        to   = ::Date.today - 1

        between(from: from, to: to).to_date
      end

      def birthday(legacy_min_age = NOT_GIVEN, legacy_max_age = NOT_GIVEN, min_age: 18, max_age: 65)
        if legacy_min_age != NOT_GIVEN
          warn_with_uplevel 'Passing `min_age` with the 1st argument of `Date.birthday` is deprecated. Use keyword argument like `Date.birthday(min_age: ...)` instead.', uplevel: 1
          min_age = legacy_min_age
        end
        if legacy_max_age != NOT_GIVEN
          warn_with_uplevel 'Passing `max_age` with the 2nd argument of `Date.birthday` is deprecated. Use keyword argument like `Date.birthday(max_age: ...)` instead.', uplevel: 1
          max_age = legacy_max_age
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
