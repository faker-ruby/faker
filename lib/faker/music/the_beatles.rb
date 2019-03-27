# frozen_string_literal: true

module Faker
  class Music
    class TheBeatles < Base
      class << self
        def member
          fetch('the_beatles.members')
        end

        def album
          fetch('the_beatles.albums')
        end

        def song
          fetch('the_beatles.songs')
        end
      end
    end
  end
end
