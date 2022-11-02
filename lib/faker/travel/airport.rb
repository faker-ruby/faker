# frozen_string_literal: true

module Faker
  class Travel
    class Airport < Base
      class << self
        ##
        # Produces random US Airport by name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Travel::Airport.united_states #=> "San Francisco International Airport"
        #
        # @faker.version next
        def united_states
          @united_states = %w[large medium small]
          fetch("airport.united_states.#{@united_states.sample}")
        end

        ##
        # Produces random large US Airport by name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Travel::Airport.us_large #=> "Los Angeles International Airport"
        #
        # @faker.version next
        def us_large
          fetch('airport.united_states.large')
        end

        ##
        # Produces random medium US Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_medium #=> "Albuquerque International Sunport"
        #
        # @faker.version next
        def us_medium
          fetch('airport.united_states.medium')
        end

        ##
        # Produces random small US Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_small #=> "Palm Springs International Airport"
        #
        # @faker.version next
        def us_small
          fetch('airport.united_states.small')
        end

        ##
        # Produces random US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_iata #=> "DEN"
        #
        # @faker.version next
        def us_iata
          @us_iata_code = %w[large medium small]
          fetch("airport.united_states.us_iata_code.#{@us_iata_code.sample}")
        end

        ##
        # Produces random large US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_iata_large #=> "LAX"
        #
        # @faker.version next
        def us_iata_large
          fetch('airport.united_states.us_iata_code.large')
        end

        ##
        # Produces random medium US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_iata_medium #=> "ABQ"
        #
        # @faker.version next
        def us_iata_medium
          fetch('airport.united_states.us_iata_code.medium')
        end

        ##
        # Produces random small US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.us_iata_small #=> "ALB"
        #
        # @faker.version next
        def us_iata_small
          fetch('airport.united_states.us_iata_code.small')
        end

        ##
        # Produces random EU Airport by name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Travel::Airport.european_union #=> "Frankfurt Airport"
        #
        # @faker.version next
        def european_union
          @european_union = %w[large medium]
          fetch("airport.european_union.#{@european_union.sample}")
        end

        ##
        # Produces random large EU Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.eu_large #=> "Munich Airport"
        #
        # @faker.version next
        def eu_large
          fetch('airport.european_union.large')
        end

        ##
        # Produces random medium EU Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.eu_medium #=> "Dublin Airport"
        #
        # @faker.version next
        def eu_medium
          fetch('airport.european_union.medium')
        end

        ##
        # Produces random EU Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.eu_iata #=> "FRA"
        #
        # @faker.version next
        def eu_iata
          @eu_iata_code = %w[large medium]
          fetch("airport.european_union.eu_iata_code.#{@eu_iata_code.sample}")
        end

        ##
        # Produces random large EU Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.eu_iata_large #=> "FRA"
        #
        # @faker.version next
        def eu_iata_large
          fetch('airport.european_union.eu_iata_code.large')
        end

        ##
        # Produces random medium EU Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.eu_iata_medium #=> "GLA"
        #
        # @faker.version next
        def eu_iata_medium
          fetch('airport.european_union.eu_iata_code.medium')
        end
      end
    end
  end
end
