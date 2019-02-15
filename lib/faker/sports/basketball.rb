# frozen_string_literal: true

module Faker
  class Sports
    class Basketball < Base
      class << self
        def team
          fetch('basketball.teams')
        end

        def player
          fetch('basketball.players')
        end

        def coach
          fetch('basketball.coaches')
        end

        def position
          fetch('basketball.positions')
        end
      end
    end
  end
end
