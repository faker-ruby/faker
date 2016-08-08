module Faker
  class Pet < Base
    class << self
      def name
        fetch('pet.names')
      end

      def type
        fetch('pet.types')
      end
    end
  end
end
