# frozen_string_literal: true

module Faker
  class Travel
    class Airline < Base
      class << self
        ##
        # Produces random Airline by name and takes argument for country code
        #
        # @param country_code [String] two letter country code, i.e. US, CA, GB, DE, AE, QA, JP, AU, SG, etc.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airline.name(country_code: 'US') => "American Airlines"
        #
        # @faker.version next
        def name(country_code:)
          fetch("airline.#{country_code}.name")
        end

        ##
        # Produces random Airline by IATA code and takes argument for country code
        #
        # @param country_code [String] two letter country code, i.e. US, CA, GB, DE, AE, QA, JP, AU, SG, etc.
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::Airline.iata(country_code: 'US') => "AA"
        #
        # @faker.version next
        def iata(country_code:)
          fetch("airline.#{country_code}.iata")
        end
      end
    end
  end
end
