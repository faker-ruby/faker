module Faker
  class Pokemon < Base
    class << self
      def name
        fetch('pokemon.names')
      end

      def location
        fetch('pokemon.locations')
      end
    end
  end
end