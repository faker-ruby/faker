# frozen_string_literal: true

module Faker
  class Games
    class AgeOfEmpires2 < Base
      class << self
        ##
        # Produces the name of a civilization from Age of Empires 2.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::AgeOfEmpires2.civilization #=> "Britons"
        #
        # @faker.version 2.14.0
        def civilization
          fetch('games.age_of_empires2.civilization')
        end

        ##
        # Produces the name of a infantry troops from Age of Empires 2.
        #
        # @return [String]
        #
        # @example
        #   Faker::Games::AgeOfEmpires2.infantry #=> "Two-Handed Swordsman"
        #
        # @faker.version 2.14.0
        def infantry
          fetch('games.age_of_empires2.infantry')
        end
      end
    end
  end
end
