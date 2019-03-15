# frozen_string_literal: true

module Faker
  class Robin
    class << self
      extend Gem::Deprecate

      def quote
        Faker::Quote.robin
      end

      deprecate :quote, 'Faker::Quote.robin', 2019, 01
    end
  end
end
