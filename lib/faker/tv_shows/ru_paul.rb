# frozen_string_literal: true

module Faker
  module TvShows
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
