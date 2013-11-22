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

      def price
        random = Random.new
        (random.rand(0..100.0) * 100).floor/100.0
      end    
    end
  end
end
