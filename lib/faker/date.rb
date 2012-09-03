# encoding: utf-8
module Faker
  class Date < Base
    class << self
      TIME_RANGES = {
        :all => (0..23),
        :day => (9..17),
        :night => (18..23),
        :morning => (6..11),
        :afternoon => (12..17),
        :evening => (17..21),
        :midnight => (0..4)
      }

      def between(from, to, options)
        from        = get_time_object(from)
        to          = get_time_object(to)
        custom_date = Time.at(rand_in_range(from.to_f, to.to_f))
        if options[:period]
          custom_date = custom_date - hours(custom_date.hour)
          custom_date = custom_date + hours(hour_in_period(options[:period]))
        end
        custom_date
      end

      def forward(max_days = 365, options = {:period => :all})
        between(Time.now, Time.now + days(max_days), options)
      end

      def backward(max_days = 365, options = {:period => :all})
        between(Time.now - days(max_days), Time.now, options)
      end

      private

      def days(number)
        number * (60 * 60 * 24)
      end

      def hours(number)
        (60 * 60 * number)
      end

      def hour_in_period(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
        TIME_RANGES[period].to_a.sample
      end

      def get_time_object(date)
        date = DateTime.parse(date) if date.is_a?(String)
        date = date.to_time if date.respond_to?(:to_time)
        date
      end
    end
  end
end
