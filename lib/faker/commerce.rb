module Faker
  class Commerce < Base

    class << self
      def color
        fetch('commerce.color')
      end

      def department
        fetch('commerce.department')
      end

      def product_name
        fetch('commerce.product_name.adjective') + ' ' + fetch('commerce.product_name.material') + ' ' + fetch('commerce.product_name.product')
      end

      def size
        fetch('commerce.size')
      end

      def product_number
        bothify( fetch('commerce.product_number' ) )
      end

    end
  end
end
