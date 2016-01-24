module Faker
  class Cat < Base
    flexible :cat

    class << self
      def name
        fetch('cat.name')
      end

      def breed
        parse('cat.breed')
      end

      def registry
        fetch('cat.registry')
      end
    end
  end
end
