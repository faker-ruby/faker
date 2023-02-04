# frozen_string_literal: true

module Faker
  class Movies
    class AvatarI < Base
      class << self
        ##
        # Produces a character from AvatarI.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::AvatarI.character #=> "Jake Sully"
        #
        # @faker.version 3.1.1
        def character
          fetch('avatari.characters')
        end

        ##
        # Produces a date from AvatarI.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::AvatarI.date #=> "December 15, 2022"
        #
        # @faker.version 3.1.1
        def date
          fetch('avatari.dates')
        end

        ##
        # Produces a quote from AvatarI.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::AvatarI.quote
        #     #=> "If it ain't raining, we ain't training."
        #
        # @faker.version 3.1.1
        def quote
          fetch('avatari.quotes')
        end
      end
    end
  end
end
