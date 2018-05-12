module Faker
  class Show < Base

    class << self

      def musical
        fetch('show.musical')
      end

      def kids_musical
        fetch('show.kids_musical')
      end

      def play
        fetch('show.play')
      end

    end
  end
end
