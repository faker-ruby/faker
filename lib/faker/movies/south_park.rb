# frozen_string_literal: true

module Faker
  module Movies
    class SouthPark < Base
      class << self
        extend Gem::Deprecate

        def character
          Faker::TvShows::SouthPark.character
        end

        def quote
          Faker::TvShows::SouthPark.quote
        end

        deprecate :character, 'Faker::TvShows::SouthPark.character', 2018, 10
        deprecate :quote, 'Faker::TvShows::SouthPark.quote', 2018, 10
      end
    end
  end
end
