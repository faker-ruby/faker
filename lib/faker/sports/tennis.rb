# frozen_string_literal: true

module Faker
  class Sports
    class Tennis < Base
      class << self
        ##
        # Produces the name of an ATP Grand Slam.
        #
        # @return [String]
        #
        # @example
        #   Faker::Sports::Tennis.grand_slam #=> "Roland-Garros"
        #
        # @faker.version 2.6.0
        def grand_slam
          fetch('tennis.grand_slams')
        end
      end
    end
  end
end
