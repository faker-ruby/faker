# frozen_string_literal: true

module Faker
  class SingularSiegler < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quotes::SingularSiegler.quote
      end

      deprecate :quote, 'Faker::Quotes::SingularSiegler.quote', 2018, 12
    end
  end
end
