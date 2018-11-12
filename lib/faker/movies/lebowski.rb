# frozen_string_literal: true

module Faker
  module Movies
    class Lebowski < Base
      class << self
        def actor
          fetch('lebowski.actors')
        end

        def character
          fetch('lebowski.characters')
        end

        def quote
          fetch('lebowski.quotes')
        end
      end
    end
  end
end
