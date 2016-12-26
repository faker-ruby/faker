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
      def between(from, to, period = :all, format = nil)
        time = period == :between ? rand(from..to) : date_with_random_time(super(from, to), period)
        time_with_format(time, format)
      end

      def forward(days = 365, period = :all, format = nil)
        time_with_format(date_with_random_time(super(days), period), format)
      end

      def backward(days = 365, period = :all, format = nil)
        time_with_format(date_with_random_time(super(days), period), format)
      end

      private

      def date_with_random_time(date, period)
        ::Time.local(date.year, date.month, date.day, hours(period), minutes, seconds)
      end

      def time_with_format(time, format)
        format.nil? ? time : I18n.l( DateTime.parse(time.to_s), :format => format )
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
