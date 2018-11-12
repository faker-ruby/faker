# frozen_string_literal: true

module Faker
  class BackToTheFuture < Base
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

      deprecate :character, 'Faker::Movies::BackToTheFuture.character', 2018, 12
      deprecate :date, 'Faker::Movies::BackToTheFuture.date', 2018, 12
      deprecate :quote, 'Faker::Movies::BackToTheFuture.quote', 2018, 12
    end
  end
end
