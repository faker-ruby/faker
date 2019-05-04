# frozen_string_literal: true

module Faker
  class Show < Base
    class << self
      def adult_musical
        fetch('show.adult_musical')
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
