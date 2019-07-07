# frozen_string_literal: true

require_relative 'music'

module Faker
  class Music
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
