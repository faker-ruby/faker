# frozen_string_literal: true

module Faker
  module TV
    class Buffy < Base
      class << self
        def character
          fetch('buffy.characters')
        end

        def quote
          fetch('buffy.quotes')
        end

        def celebrity
          fetch('buffy.celebrities')
        end

        def big_bad
          fetch('buffy.big_bads')
        end

        def episode
          fetch('buffy.episodes')
        end
      end
    end
  end
end
