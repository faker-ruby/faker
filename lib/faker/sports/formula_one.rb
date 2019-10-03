# frozen_string_literal: true

module Faker
  class Sports
    class FormulaOne < Base
      class << self
        ##
        # Produces the name of a formula one team.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::FormulaOne.team #=> "Scuderia Ferrari"
        #
        # @faker.version 1.9.4
        def team
          fetch('formula_one.teams')
        end

        ##
        # Produces the name of a formula one driver.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::FormulaOne.driver #=> "Carlos Sainz"
        #
        # @faker.version 1.9.4
        def driver
          fetch('formula_one.drivers')
        end

        ##
        # Produces the name of a formula one circuit.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::FormulaOne.circuit #=> "Silverstone"
        #
        # @faker.version 1.9.4
        def circuit
          fetch('formula_one.circuits')
        end
      end
    end
  end
end
