# frozen_string_literal: true

module Faker
  module Games
    class LeagueOfLegends < Base
      class << self
        def champion
          fetch('games.league_of_legends.champion')
        end

        def location
          fetch('games.league_of_legends.location')
        end

        def quote
          fetch('games.league_of_legends.quote')
        end

        def summoner_spell
          fetch('games.league_of_legends.summoner_spell')
        end

        def masteries
          fetch('games.league_of_legends.masteries')
        end

        def rank
          fetch('games.league_of_legends.rank')
        end
      end
    end
  end
end
