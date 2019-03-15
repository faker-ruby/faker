# frozen_string_literal: true

module Faker
  class LeagueOfLegends
    class << self
      extend Gem::Deprecate

      def champion
        Faker::Games::LeagueOfLegends.champion
      end

      def location
        Faker::Games::LeagueOfLegends.location
      end

      def quote
        Faker::Games::LeagueOfLegends.quote
      end

      def summoner_spell
        Faker::Games::LeagueOfLegends.summoner_spell
      end

      def masteries
        Faker::Games::LeagueOfLegends.masteries
      end

      def rank
        Faker::Games::LeagueOfLegends.rank
      end

      deprecate :champion, 'Faker::Games::LeagueOfLegends.champion', 2018, 10
      deprecate :location, 'Faker::Games::LeagueOfLegends.location', 2018, 10
      deprecate :quote, 'Faker::Games::LeagueOfLegends.quote', 2018, 10
      deprecate :summoner_spell, 'Faker::Games::LeagueOfLegends.summoner_spell', 2018, 10
      deprecate :masteries, 'Faker::Games::LeagueOfLegends.masteries', 2018, 10
      deprecate :rank, 'Faker::Games::LeagueOfLegends.rank', 2018, 10
    end
  end
end
