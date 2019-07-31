# frozen_string_literal: true

module Faker
  class TvShows
    class Community < Base
      flexible :community

      class << self
        def characters
          fetch('community.characters')
        end

        def quotes
          fetch('community.quotes')
        end
      end
    end
  end
end
