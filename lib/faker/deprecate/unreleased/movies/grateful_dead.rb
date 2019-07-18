# frozen_string_literal: true

module Faker
  module Movies
    class GratefulDead < Base
      class << self
        extend Gem::Deprecate

        def player
          Faker::Music::GratefulDead.player
        end

        def song
          Faker::Music::GratefulDead.song
        end

        deprecate :player, 'Faker::Music::GratefulDead.player', 2019, 04
        deprecate :song, 'Faker::Music::GratefulDead.song', 2019, 04
      end
    end
  end
end
