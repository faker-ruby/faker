module Faker
  class Food < Base
    class << self
      def dish
        fetch('food.dish')
      end

      def ingredient
        fetch('food.ingredients')
      end

      def spice
        fetch('food.spices')
      end

      def measurement
        fetch('food.measurement_sizes') + ' ' + fetch('food.measurements')
      end
    end
  end
end
