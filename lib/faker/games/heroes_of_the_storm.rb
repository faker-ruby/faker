# frozen_string_literal: true

module Faker
  module Games
    class HeroesOfTheStorm < Base
      class << self
        def battleground
          fetch('heroes_of_the_storm.battlegrounds')
        end

        def class
          fetch('heroes_of_the_storm.classes')
        end

        def hero
          fetch('heroes_of_the_storm.heroes')
        end

        def quote
          fetch('heroes_of_the_storm.quotes')
        end
      end
    end
  end
end
