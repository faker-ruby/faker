# frozen_string_literal: true

module Faker
  class Robin < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quotes::Robin.quote
      end

      deprecate :quote, 'Faker::Quotes::Robin.quote', 2018, 12
    end
  end
end
