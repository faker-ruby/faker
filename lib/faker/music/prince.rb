# frozen_string_literal: true

module Faker
  class Music
    class Prince < Base
      class << self
        def song
          fetch('prince.song')
        end
        def lyric
          fetch('prince.lyric')
        end
        def album
          fetch('prince.album')
        end
        def band
          fetch('prince.band')
        end
      end
    end
  end
end
