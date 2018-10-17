# frozen_string_literal: true

module Faker
  module Anime
    class DragonBall < Base
      class << self
        def character
          fetch('dragon_ball.characters')
        end
      end
    end
  end
end
