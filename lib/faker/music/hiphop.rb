# frozen_string_literal: true

module Faker
  class Music
    class Hiphop < Base
      class << self
        ##
        # Produces the name of a Hip Hop Artist
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Hiphop.artist #=> "Lil Wayne"
        #
        # @faker.version next
        def artist
          fetch('hiphop.artist')
        end

        ##
        # Produces the name of a Hip Hop Group
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Hiphop.groups #=> "OVO"
        #
        # @faker.version next

        def groups
          fetch('hiphop.groups')
        end
      end
    end
  end
end
