module Faker
  class Zelda < Base
    flexible :space
    class << self
      def game
        fetch('zelda.games')
      end

      def character
        fetch('zelda.characters')
      end
    end
  end
end
