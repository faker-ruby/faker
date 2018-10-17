# frozen_string_literal: true

module Faker
  module Movies
    class SouthPark < Base
      class << self
        def character
          fetch('south_park.characters')
        end

        def quote
          fetch('south_park.quotes')
        end
      end
    end
  end
end
