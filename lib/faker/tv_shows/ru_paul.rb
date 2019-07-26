# frozen_string_literal: true

module Faker
  class TvShows
    class RuPaul < Base
      flexible :rupaul

      class << self
        def quote
          fetch('rupaul.quotes')
        end

        def queen
          fetch('rupaul.queens')
        end
      end
    end
  end
end
