# frozen_string_literal: true

module Faker
  class Travel
    class TrainStation < Base
      class << self
        ##
        # Produces random Train Station by name and takes arguments for type, region
        #
        # @param type [String] Train station type: metro, railway
        #
        # @param region [String] Train station region: united_kingdom, spain
        #
        # @return [String]
        #
        # @example
        # Faker::Travel::TrainStation.name(type: 'metro', region: 'united_kingdom') => "Brockley"
        #
        # @faker.version next
        def name(type:, region:)
          fetch("train_station.#{type}.#{region}")
        end
      end
    end
  end
end
