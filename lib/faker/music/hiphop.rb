# frozen_string_literal: true

module Faker
  class Music
    class Hiphop < Base
      class << self
        ##
        # Produces Name of HipHop Artist
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Hiphop.group #=> "OVO"
        #
        # @faker.version 1.9.2
        def artist
          fetch('hiphop.artist')
        end

        # @example
        #   Faker::Music::Hiphop.artist #=> "Lil Wayne"
        #

        def groups
          fetch('hiphop.groups')
        end
      end
    end
  end
end
