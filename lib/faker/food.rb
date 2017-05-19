module Faker
  class Food < Base
    class << self
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
