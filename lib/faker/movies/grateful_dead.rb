# frozen_string_literal: true

module Faker
  module Movies
    class GratefulDead < Base
      class << self
        def player
          fetch('grateful_dead.players')
        end

        def song
          fetch('grateful_dead.songs')
        end
      end
    end
  end
end
