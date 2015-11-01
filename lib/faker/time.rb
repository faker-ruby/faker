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
        time_parameters = from.is_a?(::Time) && to.is_a?(::Time)

        if time_parameters
          random_time = Faker::Base::rand_in_range(from.to_f, to.to_f)
          random_time = ::Time.at(random_time)
        else
          random_time = super(from, to).to_time + random_time(period)
        end

        random_time
      end

      def forward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      def backward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      private

      def random_time(period)
        hours(period) + minutes + seconds
      end

      def hours(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
        hour_at_period = TIME_RANGES[period].to_a.sample

        (60 * 60 * hour_at_period)
      end

      def minutes
        60 * seconds
      end

      def seconds
        (0..59).to_a.sample
      end
    end
  end
end
