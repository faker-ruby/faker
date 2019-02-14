# frozen_string_literal: true

module Faker
  class Sports
    class Football < Base
      class << self
        def team
          fetch('football.teams')
        end

        def player
          fetch('football.players')
        end

        def coach
          fetch('football.coaches')
        end

        def competition
          fetch('football.competitions')
        end

        def position
          fetch('football.positions')
        end
      end
    end
  end
end
