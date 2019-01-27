# frozen_string_literal: true

module Faker
  module TvShows
    class HeyArnold < Base
      flexible :hey_arnold

      class << self
        def character
          fetch('hey_arnold.characters')
        end

        def location
          fetch('hey_arnold.locations')
        end

        def quote
          fetch('hey_arnold.quotes')
        end
      end
    end
  end
end
