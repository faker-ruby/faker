# frozen_string_literal: true

module Faker
  class Travel
    class TrainStation < Base
      class << self
        ##
        # Produces random Train Station by name and takes optional arguments for type and region
        #
        # @param type [String] Train station type: metro, railway
        #
        # @param region [String] Train station region: germany, spain, united_kingdom, united_states
        #
        # @return [String]
        #
        # @examples
        # Faker::Travel::TrainStation.name(type: 'metro', region: 'united_kingdom') => "Brockley"
        # Faker::Travel::TrainStation.name(type: 'railway') => "Düsseldorf Hauptbahnhof"
        # Faker::Travel::TrainStation.name(region: 'spain') => "Santa Eulàlia"
        #
        # @faker.version next
        def name(type: nil, region: nil)
          types = translate('faker.train_station').keys
          regions = translate('faker.train_station.metro').keys

          if type.nil? && region.nil?
            type = sample(types)
            region = sample(regions)
          elsif type.nil?
            validate_arguments(region, regions, 'region')
            type = sample(types)
          elsif region.nil?
            validate_arguments(type, types, 'type')
            region = sample(regions)
          end

          fetch("train_station.#{type.downcase}.#{region.downcase}")
        end

        def validate_arguments(argument, correct_values, argument_name)
          return if correct_values.include?(argument.downcase.to_sym)

          raise ArgumentError, "'#{argument.downcase}' not found, #{argument_name} can be blank, or one of the following: #{correct_values.join(', ')}"
        end
      end
    end
  end
end
