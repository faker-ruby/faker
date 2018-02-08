module Faker
  class Restaurant < Base
    class << self
      def name
        fetch('restaurant.name')
      end

      def cuisine
        fetch('restaurant.cuisine')
      end

      def description
        fetch('restaurant.description')
      end

      def review
        fetch('restaurant.review')
      end

      def hours(options = :regular)
        if options == :military
          fetch_all('restaurant.days').map { |day| "#{day} #{get_military}" }
        else
          fetch_all('restaurant.days').map { |day| "#{day} #{get_hours}" }
        end
      end

      def get_hours
        "#{get_hour} AM to #{get_hour} PM"
      end

      def get_military
        "#{get_hour} to #{get_hour_military}"
      end

      def get_hour
        "#{fetch('restaurant.hour')}:#{fetch('restaurant.minute')}"
      end

      def get_hour_military
        "#{fetch('restaurant.hour').to_i + 12}:#{fetch('restaurant.minute')}"
      end
    end
  end
end
