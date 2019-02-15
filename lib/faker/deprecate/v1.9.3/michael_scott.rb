# frozen_string_literal: true

module Faker
  class MichaelScott
    class << self
      extend Gem::Deprecate

      def quote
        Faker::TvShows::MichaelScott.quote
      end

      deprecate :quote, 'Faker::TvShows::MichaelScott.quote', 2019, 01
    end
  end
end
