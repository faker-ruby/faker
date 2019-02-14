# frozen_string_literal: true

module Faker
  class Matz
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.matz
      end

      deprecate :quote, 'Faker::Quote.matz', 2019, 01
    end
  end
end
