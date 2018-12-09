# frozen_string_literal: true

module Faker
  class MichaelScott < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::TvShows::MichaelScott.quote
      end

      deprecate :quote, 'Faker::TvShows::MichaelScott.quote', 2018, 12
    end
  end
end
