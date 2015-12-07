module Faker
  class Commerce < Base

    class << self
      def color
        fetch('color.name')
      end

      def department(max = 3, fixed_amount = false)
        num = max if fixed_amount
        num ||= 1 + rand(max)

        categories = categories(num)

        if num > 1
          merge_categories(categories)
        else
          categories[0]
        end
      end

      def product_name
        fetch('commerce.product_name.adjective') + ' ' + fetch('commerce.product_name.material') + ' ' + fetch('commerce.product_name.product')
      end

      def material
        fetch('commerce.product_name.material')
      end

      def price(range=0..100.0)
        random = Random::DEFAULT
        (random.rand(range) * 100).floor/100.0
      end

      private

      def categories(num)
        categories = []
        while categories.length < num do
          category = fetch('commerce.department')
          categories << category unless categories.include?(category)
        end

        categories
      end

      def merge_categories(categories)
        separator = fetch('separator')
        comma_separated = categories.slice!(0...-1).join(', ')

        [comma_separated, categories[0]].join(separator)
      end
    end
  end
end
