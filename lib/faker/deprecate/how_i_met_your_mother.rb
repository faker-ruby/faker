# frozen_string_literal: true

module Faker
  class HowIMetYourMother < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::HowIMetYourMother.character
      end

      def catch_phrase
        Faker::TvShows::HowIMetYourMother.catch_phrase
      end

      def high_five
        Faker::TvShows::HowIMetYourMother.high_five
      end

      def quote
        Faker::TvShows::HowIMetYourMother.quote
      end

      deprecate :character, 'Faker::TvShows::HowIMetYourMother.character', 2018, 12
      deprecate :catch_phrase, 'Faker::TvShows::HowIMetYourMother.catch_phrase', 2018, 12
      deprecate :high_five, 'Faker::TvShows::HowIMetYourMother.high_five', 2018, 12
      deprecate :quote, 'Faker::TvShows::HowIMetYourMother.quote', 2018, 12
    end
  end
end
