module Faker
  class Witcher < Base
    class << self
      def character
        fetch('witcher.characters')
      end

      def witcher
        fetch('witcher.witchers')
      end

      def school
        fetch('witcher.schools')
      end

      def city
        fetch('witcher.cities')
      end

      def quote
        fetch('witcher.quotes')
      end

      def monster
        fetch('witcher.monsters')
      end
    end
  end
end
