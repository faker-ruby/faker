# frozen_string_literal: true

module Faker
  class RockBand < Base
    class << self
      extend Gem::Deprecate

      def name
        Faker::Music::RockBand.name
      end

      deprecate :name, 'Faker::Music::RockBand.name', 2018, 12
    end
  end
end
