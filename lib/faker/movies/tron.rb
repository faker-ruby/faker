# frozen_string_literal: true

module Faker
  class Movies
    class TRON < Base
      class << self
        ##
        # Produces a character from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.character #=> "Bit"
        #
        # @faker.version 2.15.1
        def character
          sample(characters)
        end

        ##
        # Produces a game from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.game #=> "Space Paranoids"
        #
        # @faker.version 2.15.1
        def game
          sample(games)
        end

        ##
        # Produces a location from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.location #=> "Flynn's Arcade"
        #
        # @faker.version 2.15.1
        def location
          sample(locations)
        end

        ##
        # Produces a program from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.program #=> "Clu"
        #
        # @faker.version 2.15.1
        def program
          sample(programs)
        end

        ##
        # Produces a quote from TRON.
        #
        # @param character [String] The name of a character to derive a quote from.
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.quote #=> "Greetings, Programs!"
        #
        # @example
        #   Faker::Movies::TRON.quote(character: "mcp")
        #     #=> "End of Line."
        #
        # @faker.version 2.15.1
        def quote(character: nil)
          quoted_characters = translate('faker.tron.quotes')

          if character.nil?
            character = sample(quoted_characters.keys).to_s
          else
            character = character.to_s.downcase

            # check alternate spellings, nicknames, titles of characters
            translate('faker.tron.alternate_character_spellings').each do |k, v|
              character = k.to_s if v.include?(character)
            end

            raise ArgumentError, "Character for quotes can be left blank or #{quoted_characters.keys.join(', ')}" unless quoted_characters.key?(character.to_sym)
          end

          fetch("tron.quotes.#{character}")
        end

        ##
        # Produces a tagline from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.tagline #=> "The Electronic Gladiator"
        #
        # @faker.version 2.15.1
        def tagline
          sample(taglines)
        end

        ##
        # Produces a user from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.user #=> "Light Cycle"
        #
        # @faker.version 2.15.1
        def user
          sample(users)
        end

        ##
        # Produces a vehicle from TRON.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::TRON.vehicle #=> "Light Cycle"
        #
        # @faker.version 2.15.1
        def vehicle
          sample(vehicles)
        end

        def characters
          translate('faker.tron.characters').values.flatten
        end

        def games
          fetch_all('tron.games')
        end

        def locations
          fetch_all('tron.locations')
        end

        def programs
          fetch_all('tron.characters.programs')
        end

        def taglines
          fetch_all('tron.taglines')
        end

        def users
          fetch_all('tron.characters.users')
        end

        def vehicles
          fetch_all('tron.vehicles')
        end
      end
    end
  end
end
