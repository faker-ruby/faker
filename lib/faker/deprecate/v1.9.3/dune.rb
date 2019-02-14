# frozen_string_literal: true

module Faker
  class Dune
    class << self
      extend Gem::Deprecate

      def character
        Faker::Books::Dune.character
      end

      def title
        Faker::Books::Dune.title
      end

      def planet
        Faker::Books::Dune.planet
      end

      def quote(character = nil)
        Faker::Books::Dune.quote(character)
      end

      def saying(source = nil)
        Faker::Books::Dune.saying(source)
      end

      deprecate :character, 'Faker::Books::Dune.character', 2019, 01
      deprecate :title, 'Faker::Books::Dune.title', 2019, 01
      deprecate :planet, 'Faker::Books::Dune.planet', 2019, 01
      deprecate :quote, 'Faker::Books::Dune.quote', 2019, 01
      deprecate :saying, 'Faker::Books::Dune.saying', 2019, 01
    end
  end
end
