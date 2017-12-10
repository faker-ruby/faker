module Faker
  class Date < Base
    class << self
      def between(from, to)
        from = get_date_object(from)
        to   = get_date_object(to)

        Faker::Base.rand_in_range(from, to)
      end

      def between_except(from, to, excepted)
        raise ArgumentError, "From date, to date and excepted date must not be the same" if from == to && to == excepted
        excepted = get_date_object(excepted)

        loop do
          date = between(from, to)
          break date.to_date if date != excepted
        end
      end

      def forward(days = 365)
        from = ::Date.today + 1
        to   = ::Date.today + days

        between(from, to).to_date
      end

      def backward(days = 365)
        from = ::Date.today - days
        to   = ::Date.today - 1

        between(from, to).to_date
      end

      def birthday(min_age = 18, max_age = 65)
        t = ::Date.today
        top_bound, bottom_bound = prepare_bounds(t, min_age, max_age)
        years = handled_leap_years(top_bound, bottom_bound)

        from =  ::Date.new(years[0], t.month, t.day)
        to   =  ::Date.new(years[1], t.month, t.day)

        between(from, to).to_date
      end

      private

      def prepare_bounds(t, min_age, max_age)
        [t.year - min_age, t.year - max_age]
      end

      def handled_leap_years(top_bound, bottom_bound)
        if (top_bound % 4) != 0 || (bottom_bound % 4) != 0
          [
            customized_bound(top_bound),
            customized_bound(bottom_bound, true)
          ]
        else
          [top_bound, bottom_bound]
        end
      end

      def customized_bound(bound, increase = false)
        if (bound % 4) != 0
          bound += 1 if increase
          bound -= 1 unless increase
          customized_bound(bound, increase)
        else
          bound
        end
      end

      def get_date_object(date)
        date = ::Date.parse(date) if date.is_a?(String)
        date = date.to_date if date.respond_to?(:to_date)
        date
      end
    end
  end
end
