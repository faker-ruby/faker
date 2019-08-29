# frozen_string_literal: true

module Faker
  class Game < Base
    flexible :game

    class << self
      def title
        fetch('game.title')
      end

      def genre
        fetch('game.genre')
      end

      def platform
        fetch('game.platform')
      end
    end
  end
end
