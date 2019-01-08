# frozen_string_literal: true

module Faker
  class HowIMetYourMother
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

      deprecate :character, 'Faker::TvShows::HowIMetYourMother.character', 2019, 01
      deprecate :catch_phrase, 'Faker::TvShows::HowIMetYourMother.catch_phrase', 2019, 01
      deprecate :high_five, 'Faker::TvShows::HowIMetYourMother.high_five', 2019, 01
      deprecate :quote, 'Faker::TvShows::HowIMetYourMother.quote', 2019, 01
    end
  end
end
