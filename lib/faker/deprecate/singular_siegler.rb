# frozen_string_literal: true

module Faker
  class SingularSiegler < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.singular_siegler
      end

      deprecate :quote, 'Faker::Quote.singular_siegler', 2018, 12
    end
  end
end
