module Faker
  class Restaurant < Base
    class << self
      def name
        fetch('restaurant.name')
      end
    end
  end
end
