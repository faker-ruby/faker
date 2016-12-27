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

      def high_res_time
        nowtime = '%10.4f' % ::Time.now.to_f
        nowtime = nowtime.to_f * 10_000
        nowtime = nowtime.to_i
        nowtime
      end

      def todays_date
        today = ::Date.today
        reg_date = today.to_s
        reg_date
      end

      def time_and_date
        td = ::Time.now
        td = td.strftime('%Y-%m-%d %H:%M')
        td
      end

      def expiry_date
        today = ::Date.today
        exp_date = today + 365
        exp_date = exp_date.to_s
        exp_date
      end

      def tomorrow
        time1 = ::Time.new
        future = time1 + 86_400
        future.strftime('%Y-%m-%d')
      end

      def currentepoch
        ::Time.now.to_i
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
