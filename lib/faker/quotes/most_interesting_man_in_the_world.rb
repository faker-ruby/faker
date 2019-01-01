# frozen_string_literal: true

module Faker
  class Quotes
    class MostInterestingManInTheWorld < Base
      class << self
        def quote
          fetch('most_interesting_man_in_the_world.quotes')
        end
      end
    end
  end
end
