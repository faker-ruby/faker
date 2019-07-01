# frozen_string_literal: true

module Faker
  module TvShows
    class Archer < Base
      flexible :archer

      class << self
        def character
          fetch('archer.character')
        end

        def quote
          fetch('archer.quote')
        end
      end
    end
  end
end
