# frozen_string_literal: true

module Faker
  class Travel
    class Airport < Base
      class << self
        ##
        # Produces random Airport by name and takes arguments for size and region
        #
        # @param size [String] airport size, united_states has large, or medium, or small, european_union has large, or medium
        #
        # @param region [String] airport region, currently available -> united_states or european_union
        #
        # @retrun [String]
        #
        # @example
        # Faker::Travel::Airport.name('large', 'united_states') => "Los Angeles International Airport"
        #
        # @faker.version next
        def name(size, region)
          fetch("airport.#{region}.#{size}")
        rescue I18n::MissingTranslationData
          p 'valid arguments are size && region -> US has size large medium small, EU has size large medium -- united_states || european_union'
        end

        ##
        # Produces random Airport by IATA code and takes arguments for size and region
        #
        # @param size [String] airport size, united_states has large, or medium, or small, european_union has large, or medium
        #
        # @param region [String] airport region, currently available -> united_states or european_union
        #
        # @retrun [String]
        #
        # @example
        # Faker::Travel::Airport.iata('large', 'united_states') => "LAX"
        #
        # @faker.version next
        def iata(size, region)
          fetch("airport.#{region}.iata_code.#{size}")
        rescue I18n::MissingTranslationData
          p 'valid arguments are size && region -> US has size large medium small, EU has size large medium -- united_states || european_union'
        end
      end
    end
  end
end
