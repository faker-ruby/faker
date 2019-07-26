# frozen_string_literal: true

module Faker
  class Movies
    class Ghostbusters < Base
      class << self
        def actor
          fetch('ghostbusters.actors')
        end

        def character
          fetch('ghostbusters.characters')
        end

        def quote
          fetch('ghostbusters.quotes')
        end
      end
    end
  end
end
