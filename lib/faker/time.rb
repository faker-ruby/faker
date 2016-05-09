module Faker
  class Time < Date
    TIME_RANGES = {
      :all => (0..23),
      :day => (9..17),
      :night => (18..23),
      :morning => (6..11),
      :afternoon => (12..17),
      :evening => (17..21),
      :midnight => (0..4)
    }

    class << self
      def between(from, to, period = :all)
        date_with_random_time(super(from, to), period)
      end

      def forward(days = 365, period = :all)
        date_with_random_time(super(days), period)
      end

      def backward(days = 365, period = :all)
        date_with_random_time(super(days), period)
      end

      private

      def date_with_random_time(date, period)
        ::Time.local(date.year, date.month, date.day, hours(period), minutes, seconds)
      end

      def hours(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
        TIME_RANGES[period].to_a.sample
      end

      def minutes
        seconds
      end

      def seconds
        (0..59).to_a.sample
      end
    end
  end
end
