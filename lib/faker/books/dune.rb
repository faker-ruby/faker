# frozen_string_literal: true

module Faker
  class Books
    class Dune < Base
      class << self
        # QUOTED_CHARACTERS = fetch("dune.quotes")
        # SAYING_SOURCES = %w(translate("faker.dune.sources"))

        def character
          fetch('dune.characters')
        end

        def title
          fetch('dune.titles')
        end

        def planet
          fetch('dune.planets')
        end

        def quote(legacy_character = NOT_GIVEN, character: nil)
          if legacy_character != NOT_GIVEN
            warn_with_uplevel 'Passing `character` with the 1st argument of `Dune.quote` is deprecated. Use keyword argument like `Dune.quote(character: ...)` instead.', uplevel: 1
            character = legacy_character
          end

          quoted_characters = translate('faker.dune.quotes').keys

          if character.nil?
            character = sample(quoted_characters).to_s
          else
            character = character.to_s.downcase

            unless quoted_characters.include?(character.to_sym)
              raise ArgumentError,
                    "Characters quoted can be left blank or #{quoted_characters.join(', ')}"
            end
          end

          fetch('dune.quotes.' + character)
        end

        def saying(legacy_source = NOT_GIVEN, source: nil)
          if legacy_source != NOT_GIVEN
            warn_with_uplevel 'Passing `source` with the 1st argument of `Dune.saying` is deprecated. Use keyword argument like `Dune.saying(source: ...)` instead.', uplevel: 1
            source = legacy_source
          end

          sourced_sayings = translate('faker.dune.sayings').keys

          if source.nil?
            source = sample(sourced_sayings).to_s
          else
            source = source.to_s.downcase

            unless sourced_sayings.include?(source.to_sym)
              raise ArgumentError,
                    "Sources quoted in sayings can be left blank or #{sourced_sayings.join(', ')}"
            end
          end

          fetch('dune.sayings.' + source)
        end
      end
    end
  end
end
