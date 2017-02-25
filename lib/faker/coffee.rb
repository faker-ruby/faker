module Faker
  class Coffee < Base
    flexible :coffee

    class << self
      def silly_blend_name
        fetch('coffee.silly_blend_name')
      end

      def origin
        fetch('coffee.origin')
      end

      def farm
        fetch('coffee.farm')
      end

      def variety
        fetch('coffee.variety')
      end

      def notes
        fetch('coffee.notes')
      end
    end
  end
end
