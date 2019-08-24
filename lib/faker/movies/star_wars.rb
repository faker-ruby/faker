# frozen_string_literal: true

module Faker
  class Movies
    class StarWars < Base
      class << self
        def call_squadron
          sample(call_squadrons)
        end

        def call_sign
          numerify(parse('star_wars.call_sign'))
        end

        def call_number
          sample(call_numbers)
        end

        def character
          sample(characters)
        end

        def droid
          sample(droids)
        end

        def planet
          sample(planets)
        end

        def specie
          sample(species)
        end

        def vehicle
          sample(vehicles)
        end

        def wookiee_sentence
          sentence = sample(wookiee_words).capitalize

          rand(0..10).times { sentence += ' ' + sample(wookiee_words) }

          sentence + sample(['.', '?', '!'])
        end

        def quote(legacy_character = NOT_GIVEN, character: nil)
          if legacy_character != NOT_GIVEN
            warn_with_uplevel 'Passing `character` with the 1st argument of `StarWars.quote` is deprecated. Use keyword argument like `StarWars.quote(character: ...)` instead.', uplevel: 1
            character = legacy_character
          end

          quoted_characters = translate('faker.star_wars.quotes')

          if character.nil?
            character = sample(quoted_characters.keys).to_s
          else
            character = character.to_s.downcase

            # check alternate spellings, nicknames, titles of characters
            translate('faker.star_wars.alternate_character_spellings').each do |k, v|
              character = k.to_s if v.include?(character)
            end

            unless quoted_characters.key?(character.to_sym)
              raise ArgumentError, "Character for quotes can be left blank or #{quoted_characters.keys.join(', ')}"
            end
          end

          fetch('star_wars.quotes.' + character)
        end

        def call_numbers
          fetch_all('star_wars.call_numbers')
        end

        def call_squadrons
          fetch_all('star_wars.call_squadrons')
        end

        def characters
          fetch_all('star_wars.characters')
        end

        def droids
          fetch_all('star_wars.droids')
        end

        def planets
          fetch_all('star_wars.planets')
        end

        def species
          fetch_all('star_wars.species')
        end

        def vehicles
          fetch_all('star_wars.vehicles')
        end

        def wookiee_words
          fetch_all('star_wars.wookiee_words')
        end

        alias wookie_sentence wookiee_sentence
        alias wookie_words wookiee_words
      end
    end
  end
end
