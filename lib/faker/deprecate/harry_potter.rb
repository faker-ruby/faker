# frozen_string_literal: true

module Faker
  class HarryPotter
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::HarryPotter.character
      end

      def location
        Faker::Movies::HarryPotter.location
      end

      def quote
        Faker::Movies::HarryPotter.quote
      end

      def book
        Faker::Movies::HarryPotter.book
      end

      def house
        Faker::Movies::HarryPotter.house
      end

      def spell
        Faker::Movies::HarryPotter.spell
      end

      deprecate :character, 'Faker::Movies::HarryPotter.character', 2019, 01
      deprecate :location, 'Faker::Movies::HarryPotter.location', 2019, 01
      deprecate :quote, 'Faker::Movies::HarryPotter.quote', 2019, 01
      deprecate :book, 'Faker::Movies::HarryPotter.book', 2019, 01
      deprecate :house, 'Faker::Movies::HarryPotter.house', 2019, 01
      deprecate :spell, 'Faker::Movies::HarryPotter.spell', 2019, 01
    end
  end
end
