# frozen_string_literal: true

module Faker
  class DrWho < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::TvShows::DrWho.character
      end

      def the_doctor
        Faker::TvShows::DrWho.the_doctor
      end

      def actor
        Faker::TvShows::DrWho.actor
      end

      def catch_phrase
        Faker::TvShows::DrWho.catch_phrase
      end

      def quote
        Faker::TvShows::DrWho.quote
      end

      def villian
        Faker::TvShows::DrWho.villian
      end

      def specie
        Faker::TvShows::DrWho.specie
      end

      deprecate :character, 'Faker::TvShows::DrWho.character', 2018, 10
      deprecate :the_doctor, 'Faker::TvShows::DrWho.the_doctor', 2018, 10
      deprecate :actor, 'Faker::TvShows::DrWho.actor', 2018, 10
      deprecate :catch_phrase, 'Faker::TvShows::DrWho.catch_phrase', 2018, 10
      deprecate :quote, 'Faker::TvShows::DrWho.quote', 2018, 10
      deprecate :villian, 'Faker::TvShows::DrWho.villian', 2018, 10
      deprecate :specie, 'Faker::TvShows::DrWho.specie', 2018, 10
    end
  end
end
