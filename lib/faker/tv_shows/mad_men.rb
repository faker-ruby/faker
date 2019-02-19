# frozen_string_literal: true

module Faker
  module TvShows
    class MadMen < Base
      flexible :mad_men

      class << self
        def character
          fetch('mad_men.characters')
        end

        def quote
          fetch('mad_men.quotes')
        end
      end
    end
  end
end
