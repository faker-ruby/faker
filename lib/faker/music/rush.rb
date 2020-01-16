# frozen_string_literal: true

require_relative 'music'

module Faker
  class Music
    class Rush < Base
      class << self
        ##
        # Produces the name of a member of Rush
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Rush.player #=> "Geddy Lee"
        #
        # @faker.version next
        def player
          fetch('rush.players')
        end

        ##
        # Produces the name of a album by Rush
        #
        # @return [String]
        #
        # @example
        #   Faker::Music::Rush.albums #=> "Hold Your Fire"
        #
        # @faker.version next
        def album
          fetch('rush.albums')
        end
      end
    end
  end
end
