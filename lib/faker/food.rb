module Faker
  class Food < Base
    class << self
      def ingredient
        fetch('food.ingredients')
      end

      def spices
        fetch('food.spices')
      end

      def measurement
        ["1/4 ", "1/3 ", "1/2 ", "1 ", "2 ", "3 "].sample + fetch('food.measurements')
      end
    end
  end
end
