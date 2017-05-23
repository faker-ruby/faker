module Faker
  class Witcher < Base
    class << self

      def character
        parse('witcher.character')
      end

      def witcher
        parse('witcher.witcher')
      end

      def school
        parse('witcher.school')
      end

      def location
        parse('witcher.location')
      end

    end
  end
end
