module Faker
  class Utapri < Base
    flexible :space
    class << self
      def character
        fetch("utapri.characters")
      end

      def song
        fetch("utapri.songs")
      end
    end
  end
end
