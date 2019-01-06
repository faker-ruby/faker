# frozen_string_literal: true

module Faker
  class Hobbit < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::Hobbit.character
      end

      def thorins_company
        Faker::Movies::Hobbit.thorins_company
      end

      def quote
        Faker::Movies::Hobbit.quote
      end

      def location
        Faker::Movies::Hobbit.location
      end

      deprecate :character, 'Faker::Movies::Hobbit.character', 2019, 0o1
      deprecate :thorins_company, 'Faker::Movies::Hobbit.thorins_company', 2019, 0o1
      deprecate :quote, 'Faker::Movies::Hobbit.quote', 2019, 0o1
      deprecate :location, 'Faker::Movies::Hobbit.location', 2019, 0o1
    end
  end
end
