module Faker
  class TimeCode < Time
    TIME_RANGES = {
      :all => (0..23)
    }

    class << self

      def between(from, to, period = :all)
        random_timecode(super(from, to), period)
      end

      def forward(hours = 23, period = :all)
        random_timecode(super(hours), period)
      end

      def backward(hours = 23, period = :all)
        random_timecode(super(hours), period)
      end

      private

      def random_timecode(period)
        ::Time.local(hours(period), minutes, seconds, frames)
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

      def frames
        (0..23).to_a.sample
      end
    end
  end
end
