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

        ##
        # Produces an animated film from Disney.
        #
        # @return [String]
        #
        # @example
        #   Faker::Movies::Disney.film #=> "Lion King"
        #
        # @faker.version next
        def film
          fetch('disney.film')
        end
      end
    end
  end
end
