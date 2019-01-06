# frozen_string_literal: true

module Faker
  class Matz < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.matz
      end

      deprecate :quote, 'Faker::Quote.matz', 2018, 12
    end
  end
end
