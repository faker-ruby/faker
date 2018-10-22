# frozen_string_literal: true

module Faker
  class SiliconValley < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::SiliconValley.character
      end

      def company
        Faker::TvShows::SiliconValley.company
      end

      def quote
        Faker::TvShows::SiliconValley.quote
      end

      def app
        Faker::TvShows::SiliconValley.app
      end

      def invention
        Faker::TvShows::SiliconValley.invention
      end

      def motto
        Faker::TvShows::SiliconValley.motto
      end

      def url
        Faker::TvShows::SiliconValley.url
      end

      def email
        Faker::TvShows::SiliconValley.email
      end

      deprecate :character, 'Faker::TvShows::SiliconValley.character', 2018, 10
      deprecate :company, 'Faker::TvShows::SiliconValley.company', 2018, 10
      deprecate :quote, 'Faker::TvShows::SiliconValley.quote', 2018, 10
      deprecate :app, 'Faker::TvShows::SiliconValley.app', 2018, 10
      deprecate :invention, 'Faker::TvShows::SiliconValley.invention', 2018, 10
      deprecate :motto, 'Faker::TvShows::SiliconValley.motto', 2018, 10
      deprecate :url, 'Faker::TvShows::SiliconValley.url', 2018, 10
      deprecate :email, 'Faker::TvShows::SiliconValley.email', 2018, 10
    end
  end
end
