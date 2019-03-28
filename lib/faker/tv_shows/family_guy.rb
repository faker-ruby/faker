# frozen_string_literal: true

module Faker
  module TvShows
    class FamilyGuy < Base
      flexible :family_guy

      class << self
        def character
          fetch('family_guy.character')
        end

        def location
          fetch('family_guy.location')
        end

        def quote
          fetch('family_guy.quote')
        end
      end
    end
  end
end
