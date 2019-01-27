# frozen_string_literal: true

module Faker
  class Music
    class RockBand < Base
      class << self
        def name
          fetch('rock_band.name')
        end
      end
    end
  end
end
