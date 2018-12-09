# frozen_string_literal: true

module Faker
  class AquaTeenHungerForce < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::AquaTeenHungerForce.character
      end

      deprecate :character, 'Faker::TvShows::AquaTeenHungerForce.character', 2018, 12
    end
  end
end
