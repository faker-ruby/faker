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

      deprecate :character, 'Faker::Movies::Hobbit.character', 2018, 12
      deprecate :thorins_company, 'Faker::Movies::Hobbit.thorins_company', 2018, 12
      deprecate :quote, 'Faker::Movies::Hobbit.quote', 2018, 12
      deprecate :location, 'Faker::Movies::Hobbit.location', 2018, 12
    end
  end
end
