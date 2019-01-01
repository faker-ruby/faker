# frozen_string_literal: true

module Faker
  class Matz < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quotes::Matz.quote
      end

      deprecate :quote, 'Faker::Quotes::Matz.quote', 2018, 12
    end
  end
end
