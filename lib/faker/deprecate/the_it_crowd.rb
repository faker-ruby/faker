# frozen_string_literal: true

module Faker
  class TheITCrowd < Base
    class << self
      extend Gem::Deprecate

      def actor
        Faker::TvShows::TheITCrowd.actor
      end

      def character
        Faker::TvShows::TheITCrowd.character
      end

      def email
        Faker::TvShows::TheITCrowd.email
      end

      def quote
        Faker::TvShows::TheITCrowd.quote
      end

      deprecate :actor, 'Faker::TvShows::TheITCrowd.actor', 2018, 12
      deprecate :character, 'Faker::TvShows::TheITCrowd.character', 2018, 12
      deprecate :email, 'Faker::TvShows::TheITCrowd.email', 2018, 12
      deprecate :quote, 'Faker::TvShows::TheITCrowd.quote', 2018, 12
    end
  end
end
