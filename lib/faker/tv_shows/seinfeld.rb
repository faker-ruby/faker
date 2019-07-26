# frozen_string_literal: true

module Faker
  class TvShows
    class Seinfeld < Base
      flexible :seinfeld

      class << self
        def business
          fetch('seinfeld.business')
        end

        def character
          fetch('seinfeld.character')
        end

        def quote
          fetch('seinfeld.quote')
        end
      end
    end
  end
end
