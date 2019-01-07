# frozen_string_literal: true

module Faker
  module DragonBall
    class << self
      extend Gem::Deprecate

      def character
        Faker::JapaneseMedia::DragonBall.character
      end

      deprecate :character, 'Faker::JapaneseMedia::DragonBall.character', 2019, 01
    end
  end
end
