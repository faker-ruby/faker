module Faker
  class Date < Base
    class << self
      def between(from, to)
        from = get_date_object(from)
        to   = get_date_object(to)

        Faker::Base::rand_in_range(from, to)
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
        from =  ::Date.new(t.year - min_age, t.month, t.day)
        to   =  ::Date.new(t.year - max_age, t.month, t.day)

        between(from, to).to_date
      end

      private

      def get_date_object(date)
        date = ::Date.parse(date) if date.is_a?(String)
        date = date.to_date if date.respond_to?(:to_date)
        date
      end
    end
  end
end
