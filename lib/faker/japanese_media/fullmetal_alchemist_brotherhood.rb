# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class FmaBrotherhood < Base
      class << self
        extend Gem::Deprecate

        ##
        # Produces a character from FmaBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FmaBrotherhood.character #=> "Edward Elric"
        #
        # @faker.version next
        def character
          fetch('fma_brotherhood.characters')
        end
        deprecate :character, 'Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.character', 2024, 02

        ##
        # Produces a cities from FmaBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FmaBrotherhood.city #=> "Central City"
        #
        # @faker.version next
        def city
          fetch('fma_brotherhood.cities')
        end
        deprecate :city, 'Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.city', 2024, 02

        ##
        # Produces a country from FmaBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FmaBrotherhood.country #=> "Xing"
        #
        # @faker.version next
        def country
          fetch('fma_brotherhood.countries')
        end
        deprecate :country, 'Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.country', 2024, 02
      end
    end

    class FullmetalAlchemistBrotherhood < Base
      class << self
        ##
        # Produces a character from FullmetalAlchemistBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.character #=> "Edward Elric"
        #
        # @faker.version next
        def character
          fetch('fullmetal_alchemist_brotherhood.characters')
        end

        ##
        # Produces a cities from FullmetalAlchemistBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.city #=> "Central City"
        #
        # @faker.version next
        def city
          fetch('fullmetal_alchemist_brotherhood.cities')
        end

        ##
        # Produces a country from FullmetalAlchemistBrotherhood.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::FullmetalAlchemistBrotherhood.country #=> "Xing"
        #
        # @faker.version next
        def country
          fetch('fullmetal_alchemist_brotherhood.countries')
        end
      end
    end
  end
end
