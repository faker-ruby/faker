# frozen_string_literal: true

module Faker
  class Music
    class TheBeatles < Base
      class << self
        ##
        # Produces a member from The Beatles.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::TheBeatles.member #=> "John Lennon"
        #
        # @faker.version 1.9.4
        def member
          fetch('the_beatles.members')
        end

        ##
        # Produces an album from The Beatles.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::TheBeatles.album #=> "Rubber Soul"
        #
        # @faker.version 1.9.4
        def album
          fetch('the_beatles.albums')
        end

        ##
        # Produces a song from The Beatles.
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::TheBeatles.song #=> "Here Comes The Sun"
        #
        # @faker.version 1.9.4
        def song
          fetch('the_beatles.songs')
        end
      end
    end
  end
end
