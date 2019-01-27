# frozen_string_literal: true

module Faker
  module TvShows
    class VentureBros < Base
      flexible :venture_bros

      class << self
        def character
          fetch('venture_bros.character')
        end

        def organization
          fetch('venture_bros.organization')
        end

        def vehicle
          fetch('venture_bros.vehicle')
        end

        def quote
          fetch('venture_bros.quote')
        end
      end
    end
  end
end
