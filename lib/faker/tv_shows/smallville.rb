# frozen_string_literal: true

module Faker
  module TvShows
    class Smallville < Base
      flexible :smallville

      class << self
        def character
          fetch('smallville.characters')
        end

        def main_character
          fetch('smallville.main_characters')
        end

        def quote
          fetch('smallville.quotes')
        end

        def location
          fetch('smallville.locations')
        end

        def song
          fetch('smallville.songs')
        end

        def lex_license_plate
          fetch('smallville.lex_license_plates')
        end
      end
    end
  end
end
