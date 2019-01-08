# frozen_string_literal: true

module Faker
  class RockBand
    class << self
      extend Gem::Deprecate

      def name
        Faker::Music::RockBand.name
      end

      deprecate :name, 'Faker::Music::RockBand.name', 2019, 01
    end
  end
end
