module Faker
  class Date < Base
    class << self
      def between(from, to)
        from = get_date_object(from)
        to   = get_date_object(to)

        Faker::Base.rand_in_range(from, to)
      end

      def between_except(from, to, excepted)
        begin
          date = between(from, to)
        end while date == excepted

        date
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
        return t if min_age == 0 && max_age == 0

        top_bound, bottom_bound = prepare_bounds(t, min_age, max_age)

        leap_year_fixer = 0
        leap_year_fixer = 1 if t.month == 02 && t.day == 29

        from =  ::Date.new(bottom_bound, t.month, t.day - leap_year_fixer)
        to   =  ::Date.new(top_bound, t.month, t.day - leap_year_fixer)

        between(from, to).to_date
      end

      private

      def prepare_bounds(t, min_age, max_age)
        [t.year - min_age, t.year - max_age]
      end


      def get_date_object(date)
        date = ::Date.parse(date) if date.is_a?(String)
        date = date.to_date if date.respond_to?(:to_date)
        date
      end
    end
  end
end
