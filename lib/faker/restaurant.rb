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

      def reviews
        fetch('restaurant.review')
      end

      def hours
        fetch_all('restaurant.days').map { |day| "#{day} #{get_am_hour} to #{get_pm_hour}" }
      end

      def get_am_hour
        "#{fetch('restaurant.hour')}:#{fetch('restaurant.minute')} AM"
      end

      def get_pm_hour
        "#{fetch('restaurant.hour')}:#{fetch('restaurant.minute')} PM"
      end
    end
  end
end
