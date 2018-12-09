# frozen_string_literal: true

module Faker
  class HarryPotter < Base
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

      deprecate :character, 'Faker::Movies::HarryPotter.character', 2018, 12
      deprecate :location, 'Faker::Movies::HarryPotter.location', 2018, 12
      deprecate :quote, 'Faker::Movies::HarryPotter.quote', 2018, 12
      deprecate :book, 'Faker::Movies::HarryPotter.book', 2018, 12
      deprecate :house, 'Faker::Movies::HarryPotter.house', 2018, 12
      deprecate :spell, 'Faker::Movies::HarryPotter.spell', 2018, 12
    end
  end
end
