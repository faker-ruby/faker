# frozen_string_literal: true

module Faker
  class AquaTeenHungerForce
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::AquaTeenHungerForce.character
      end

      deprecate :character, 'Faker::TvShows::AquaTeenHungerForce.character', 2019, 01
    end
  end
end
