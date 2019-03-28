# frozen_string_literal: true

module Faker
  module Games
    class SuperSmashBros < Base
      class << self
        def fighter
          fetch('games.super_smash_bros.fighter')
        end

        def stage
          fetch('games.super_smash_bros.stage')
        end
      end
    end
  end
end
