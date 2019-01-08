# frozen_string_literal: true

module Faker
  class PrincessBride
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::PrincessBride.character
      end

      def quote
        Faker::Movies::PrincessBride.quote
      end

      deprecate :character, 'Faker::Movies::PrincessBride.character', 2019, 01
      deprecate :quote, 'Faker::Movies::PrincessBride.quote', 2019, 01
    end
  end
end
