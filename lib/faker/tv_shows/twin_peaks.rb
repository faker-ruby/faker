# frozen_string_literal: true

module Faker
  class TvShows
    class TwinPeaks < Base
      flexible :twin_peaks

      class << self
        def character
          fetch('twin_peaks.characters')
        end

        def location
          fetch('twin_peaks.locations')
        end

        def quote
          fetch('twin_peaks.quotes')
        end
      end
    end
  end
end
