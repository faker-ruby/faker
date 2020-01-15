# frozen_string_literal: true

module Faker
  class Music
    class Mambo < Base
      class << self
        ##
        # Produces the name of someone that Lou Bega wants a little bit of, according to his hit 1999 song "Mambo No. 5 (A Little Bit of...)"
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Mambo.name #=> "Monica"
        #
        # @faker.version next
        def name
          fetch('mambo.name')
        end
      end
    end
  end
end
