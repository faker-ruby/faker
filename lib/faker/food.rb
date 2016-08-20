module Faker
  class Food < Base
    class << self
      def ingredient
        fetch('food.ingredients')
      end

      def spices
        fetch('food.spices')
      end
    end
  end
end
