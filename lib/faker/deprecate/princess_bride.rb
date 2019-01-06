# frozen_string_literal: true

module Faker
  class PrincessBride < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::PrincessBride.character
      end

      def quote
        Faker::Movies::PrincessBride.quote
      end

      deprecate :character, 'Faker::Movies::PrincessBride.character', 2019, 0o1
      deprecate :quote, 'Faker::Movies::PrincessBride.quote', 2019, 0o1
    end
  end
end
