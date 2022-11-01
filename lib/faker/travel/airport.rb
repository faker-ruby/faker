# frozen_string_literal: true

module Faker
  class Travel
    class Airport < Base
      class << self
        ##
        # Produces random large US Airport by name.
        #
        # @return [String]
        #
        # @example
        #   Faker::Travel::Airport.large_airport_us #=> "Los Angeles International Airport"
        #
        # @faker.version next
        def large_airport_us
          fetch('airport.large_airport_us')
        end
        ##
        # Produces random large EU Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.airport_name #=> "Munich Airport"
        #
        # @faker.version next

        def large_airport_eu
          fetch('airport.large_airport_eu')
        end
        ##
        # Produces random medium US Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.medium_airport_us #=> "Albuquerque International Sunport"
        #
        # @faker.version next

        def medium_airport_us
          fetch('airport.medium_airport_us')
        end
        ##
        # Produces random medium EU Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.medium_airport_eu #=> "Dublin Airport"
        #
        # @faker.version next

        def medium_airport_eu
          fetch('airport.medium_airport_eu')
        end
        ##
        # Produces random small US Airport by name.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.small_airport_us #=> "Des Moines International Airport"
        #
        # @faker.version next

        def small_airport_us
          fetch('airport.small_airport_us')
        end
        
        ##
        # Produces random large US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.airports_iata_code #=> "LAX"
        #
        # @faker.version next

        def iata_large_us
          fetch('airport.iata_large_us')
        end
        ##
        # Produces random large EU Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.iata_large_eu #=> "FRA"
        #
        # @faker.version next

        def iata_large_eu
          fetch('airport.iata_large_eu')
        end
        ##
        # Produces random medium US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.iata_large_eu #=> "ABQ"
        #
        # @faker.version next

        def iata_medium_us
          fetch('airport.iata_medium_us')
        end
        ##
        # Produces random medium EU Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.iata_large_eu #=> "GLA"
        #
        # @faker.version next

        def iata_medium_eu
          fetch('airport.iata_medium_eu')
        end
        ##
        # Produces random small US Airport by IATA code.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airport.iata_large_eu #=> "ALB"
        #
        # @faker.version next

        def iata_small_us
          fetch('airport.iata_small_us')
        end
      end
    end
  end
end
