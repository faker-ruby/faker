# frozen_string_literal: true

module Faker
  class DrWho < Base
    class << self
      extend Gem::Deprecate

      def character
        fetch('dr_who.character')
      end

      def the_doctor
        fetch('dr_who.the_doctors')
      end

      def actor
        fetch('dr_who.actors')
      end

      def catch_phrase
        fetch('dr_who.catch_phrases')
      end

      def quote
        fetch('dr_who.quotes')
      end

      def villian
        fetch('dr_who.villians')
      end

      def specie
        fetch('dr_who.species')
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
