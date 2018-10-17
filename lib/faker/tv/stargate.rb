# frozen_string_literal: true

module Faker
  module TV
    class Stargate < Base
      class << self
        def character
          fetch('stargate.characters')
        end

        def planet
          fetch('stargate.planets')
        end

        def quote
          fetch('stargate.quotes')
        end
      end
    end
  end
end
