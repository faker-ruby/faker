# frozen_string_literal: true

module Faker
  class Sports
    class Baseball < Base
      class << self
        def team
          fetch('baseball.teams')
        end

        def player
          fetch('baseball.players')
        end

        def position
          fetch('baseball.positions')
        end
      end
    end
  end
end
