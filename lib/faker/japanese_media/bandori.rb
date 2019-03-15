# frozen_string_literal: true

module Faker
  module JapaneseMedia
    class DragonBall < Base
      class << self
        def character
          fetch('bandori.characters')
        end

        def band
          fetch('bandori.bands')
        end
      end
    end
  end
end
