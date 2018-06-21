module Faker
  class DateTime < Faker::Date
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
      def between(from, to, period = :all, format = nil)
        date_time = date_with_random_time(super(from, to), period)
        date_time_with_format(date_time, format)
      end

      private

      def date_with_random_time(date, period)
        ::DateTime.new(date.year, date.month, date.day, hours(period), minutes, seconds)
      end

      def date_time_with_format(date_time, format)
        format.nil? ? date_time : I18n.l(date_time, format: format)
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
    end
  end
end
