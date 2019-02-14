# frozen_string_literal: true

module Faker
  class Hobbit
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

      deprecate :character, 'Faker::Movies::Hobbit.character', 2019, 01
      deprecate :thorins_company, 'Faker::Movies::Hobbit.thorins_company', 2019, 01
      deprecate :quote, 'Faker::Movies::Hobbit.quote', 2019, 01
      deprecate :location, 'Faker::Movies::Hobbit.location', 2019, 01
    end
  end
end
