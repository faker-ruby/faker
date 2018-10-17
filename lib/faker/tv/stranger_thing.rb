# frozen_string_literal: true

module Faker
  module TV
    class StrangerThings < Base
      class << self
        def quote
          fetch('stranger_things.quote')
        end

        def character
          fetch('stranger_things.character')
        end
      end
    end
  end
end
