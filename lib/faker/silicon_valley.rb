module Faker
  class SiliconValley < Base
    class << self
      def character
        fetch('silicon_valley.character')
      end

      def company
        fetch('silicon_valley.company')
      end

      def quote
        fetch('silicon_valley.quote')
      end
    end
  end
end
