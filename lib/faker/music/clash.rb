# frozen_string_literal: true

require_relative 'music'

module Faker
  class Music
    class Clash < Base
      class << self
        ##
        # Produces the name of a member of The Clash.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Clash.punk_rocker #=> "Joe Strummer"
        #
        # @faker.version next
        def punk_rocker
          fetch('clash.punk_rocker')
        end

        ##
        # Produces the name of an album by The Clash.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Clash.album #=> "Sandinista!"
        #
        # @faker.version next
        def album
          fetch('clash.album')
        end

        ##
        # Produces the name of a song by The Clash.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Clash.song #=> "Clampdown"
        #
        # @faker.version next
        def song
          fetch('clash.song')
        end
      end
    end
  end
end
