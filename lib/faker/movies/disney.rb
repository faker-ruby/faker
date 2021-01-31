# frozen_string_literal: true

module Faker
  class Movies
    class Disney < Base
      class << self
        ##
        # Produces a princess from Disney.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::Disney.princess #=> "Ariel"
        #
        # @faker.version next
        def princess
          fetch('disney.princess')
        end
      end
    end
  end
end
