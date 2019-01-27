# frozen_string_literal: true

module Faker
  class BackToTheFuture
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::BackToTheFuture.character
      end

      def date
        Faker::Movies::BackToTheFuture.date
      end

      def quote
        Faker::Movies::BackToTheFuture.quote
      end

      deprecate :character, 'Faker::Movies::BackToTheFuture.character', 2019, 01
      deprecate :date, 'Faker::Movies::BackToTheFuture.date', 2019, 01
      deprecate :quote, 'Faker::Movies::BackToTheFuture.quote', 2019, 01
    end
  end
end
