# frozen_string_literal: true

module Faker
  class Commerce < Base
    class << self
      def color
        fetch('color.name')
      end

      def promotion_code(legacy_digits = NOT_GIVEN, digits: 6)
        if legacy_digits != NOT_GIVEN
          warn_with_uplevel 'Passing `digits` with the 1st argument of `Commerce.promotion_code` is deprecated. Use keyword argument like `Commerce.promotion_code(digits: ...)` instead.', uplevel: 1
          digits = legacy_digits
        end

        [
          fetch('commerce.promotion_code.adjective'),
          fetch('commerce.promotion_code.noun'),
          Faker::Number.number(digits: digits)
        ].join
      end

      def department(legacy_max = NOT_GIVEN, legacy_fixed_amount = NOT_GIVEN, max: 3, fixed_amount: false)
        if legacy_max != NOT_GIVEN
          warn_with_uplevel 'Passing `max` with the 1st argument of `Commerce.department` is deprecated. Use keyword argument like `Commerce.department(max: ...)` instead.', uplevel: 1
          max = legacy_max
        end
        if legacy_fixed_amount != NOT_GIVEN
          warn_with_uplevel 'Passing `fixed_amount` with the 2nd argument of `Commerce.department` is deprecated. Use keyword argument like `Commerce.department(fixed_amount: ...)` instead.', uplevel: 1
          fixed_amount = legacy_fixed_amount
        end

        num = max if fixed_amount
        num ||= 1 + rand(max)

        categories = categories(num)

        return merge_categories(categories) if num > 1

        categories[0]
      end

      def product_name
        "#{fetch('commerce.product_name.adjective')} #{fetch('commerce.product_name.material')} #{fetch('commerce.product_name.product')}"
      end

      def material
        fetch('commerce.product_name.material')
      end

      def price(legacy_range = NOT_GIVEN, legacy_as_string = NOT_GIVEN, range: 0..100.0, as_string: false)
        if legacy_range != NOT_GIVEN
          warn_with_uplevel 'Passing `range` with the 1st argument of `Commerce.price` is deprecated. Use keyword argument like `Commerce.price(range: ...)` instead.', uplevel: 1
          range = legacy_range
        end
        if legacy_as_string != NOT_GIVEN
          warn_with_uplevel 'Passing `as_string` with the 2nd argument of `Commerce.price` is deprecated. Use keyword argument like `Commerce.price(as_string: ...)` instead.', uplevel: 1
          as_string = legacy_as_string
        end

        price = (rand(range) * 100).floor / 100.0
        if as_string
          price_parts = price.to_s.split('.')
          price = price_parts[0] + '.' + price_parts[-1].ljust(2, '0')
        end
        price
      end

      private

      def categories(num)
        categories = []
        while categories.length < num
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
