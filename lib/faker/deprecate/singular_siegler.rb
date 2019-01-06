# frozen_string_literal: true

module Faker
  class SingularSiegler < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.singular_siegler
      end

      deprecate :quote, 'Faker::Quote.singular_siegler', 2019, 0o1
    end
  end
end
