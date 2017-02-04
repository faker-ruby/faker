module Faker
  class HarryPotter < Base
    class << self
      def character
        fetch('harry_potter.characters')
      end

      def location
        fetch('harry_potter.locations')
      end

      def quote
        fetch('harry_potter.quotes')
      end

      def book
        fetch('harry_potter.books')
      end
    end
  end
end
