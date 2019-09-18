# frozen_string_literal: true

module Faker
  class TvShows
    class Friends < Base
      flexible :friends

      class << self
        def character
          fetch('friends.characters')
        end

        def location
          fetch('friends.locations')
        end

        def quote
          fetch('friends.quotes')
        end
      end
    end
  end
end
