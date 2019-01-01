# frozen_string_literal: true

module Faker
  class MostInterestingManInTheWorld < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quotes::MostInterestingManInTheWorld.quote
      end

      deprecate :quote, 'Faker::Quotes::MostInterestingManInTheWorld.quote', 2018, 12
    end
  end
end
