module Faker
  class SiliconValley < Base
    class << self
      def character
        fetch('silicon_valley.characters')
      end

      def company
        fetch('silicon_valley.companies')
      end

      def quote
        fetch('silicon_valley.quotes')
      end
    end
  end
end
