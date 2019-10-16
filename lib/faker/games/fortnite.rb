# frozen_string_literal: true

module Faker
  class Games
    class Fortnite < Base
      class << self
        ##
        # Produces the name of an emote from the Fortnite game Season 10 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_10 #=> "Breakneck"
        #
        # @faker.version 2.6.1
        def emotes
          parse('games.fortnite.emotes')
        end
        ##
        # Produces the name of an epic emote from the Fortnite game.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_epic #=> "Drop The Bass"
        #
        # @faker.version 2.6.1
        def emotes_epic
          parse('games.fortnite.emotes_epic')
        end
        ##
        # Produces the name of an rare emote from the Fortnite game.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_rare #=> "Dab"
        #
        # @faker.version 2.6.1
        def emotes_rare
          parse('games.fortnite.emotes_rare')
        end
        ##
        # Produces the name of an uncommon emote from the Fortnite game.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_uncommon #=> "Drop The Bass"
        #
        # @faker.version 2.6.1
        def emotes_uncommon
          parse('games.fortnite.emotes_uncommon')
        end
        ##
        # Produces the name of an emote from the Fortnite game battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass #=> "Breakneck"
        #
        # @faker.version 2.6.1
        def emotes_battlepass
          parse('games.fortnite.emotes_battlepass')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 10 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_10 #=> "Breakneck"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_10
          fetch('games.fortnite.emotes_battlepass_season_10')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 9 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_9 #=> "Cluck Strut"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_9
          fetch('games.fortnite.emotes_battlepass_season_9')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 8 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_8 #=> "Boobytrapped"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_8
          fetch('games.fortnite.emotes_battlepass_season_8')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 7 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_7 #=> "Mic Drop"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_7
          fetch('games.fortnite.emotes_battlepass_season_7')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 6 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_6 #=> "Flamenco"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_6
          fetch('games.fortnite.emotes_battlepass_season_6')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 5 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_5 #=> "Breakdown"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_5
          fetch('games.fortnite.emotes_battlepass_season_5')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 4 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_4 #=> "Orange Justice"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_4
          fetch('games.fortnite.emotes_battlepass_season_4')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 3 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_3 #=> "Take The L"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_3
          fetch('games.fortnite.emotes_battlepass_season_3')
        end
        ##
        # Produces the name of an emote from the Fortnite game Season 2 battlepass.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::Fortnite.emotes_battlepass_season_2 #=> "Floss"
        #
        # @faker.version 2.6.1
        def emotes_battlepass_season_2
          fetch('games.fortnite.emotes_battlepass_season_2')
        end
      end
    end
  end
end
