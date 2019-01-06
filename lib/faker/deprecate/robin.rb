# frozen_string_literal: true

module Faker
  class Robin < Base
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.robin
      end

      deprecate :quote, 'Faker::Quote.robin', 2018, 12
    end
  end
end
