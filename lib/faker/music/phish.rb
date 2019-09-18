# frozen_string_literal: true

module Faker
  class Music
    class Phish < Base
      class << self
        ##
        # Produces the name of a song by Phish.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Phish.song #=> "Tweezer"
        #
        # @faker.version 1.9.2
        def song
          fetch('phish.song')
        end
      end
    end
  end
end
