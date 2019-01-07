# frozen_string_literal: true

module Faker
  class Matz < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.matz
      end

      deprecate :quote, 'Faker::Quote.matz', 2019, 0o1
    end
  end
end
