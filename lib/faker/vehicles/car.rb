# frozen_string_literal: true

module Faker
  class Vehicles
    class Car < Base
      flexible :car

      class << self
        ##
        # Produces a brand of car
        #
        # @return [String]
        #
        # @example
        #   Faker::Vehicles::Car.brand #=> "Audi"
        #
        # @faker.version 2.13.0
        def brand
          fetch('car.brand')
        end

        ##
        # Produces a car model
        #
        # @return [String]
        #
        # @example
        #  Faker::Vehicles::Car.model #=> "Q3"
        #
        # @faker.version 2.13.0
        def model
          fetch('car.model')
        end

        ##
        # Produces a car version
        #
        # @return [String]
        #
        # @example
        #  Faker::Vehicles::Car.version #=> "40 TFSI Premium"
        #
        # @faker.version 2.13.0
        def version
          fetch('car.version')
        end
      end
    end
  end
end
