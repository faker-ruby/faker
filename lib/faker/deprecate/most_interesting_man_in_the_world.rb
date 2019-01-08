# frozen_string_literal: true

module Faker
  class MostInterestingManInTheWorld
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.most_interesting_man_in_the_world
      end

      deprecate :quote, 'Faker::Quote.most_interesting_man_in_the_world', 2019, 01
    end
  end
end
