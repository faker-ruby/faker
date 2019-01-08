# frozen_string_literal: true

module Faker
  class SingularSiegler
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.singular_siegler
      end

      deprecate :quote, 'Faker::Quote.singular_siegler', 2019, 01
    end
  end
end
