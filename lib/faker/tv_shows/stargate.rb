# frozen_string_literal: true

module Faker
  module TvShows
    class Stargate < Base
      flexible :stargate

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
