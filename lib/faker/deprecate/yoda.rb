# frozen_string_literal: true

module Faker
  class Yoda < Base
    class << self
      extend Gem::Deprecate

      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def quote
        Faker::Quotes::Yoda.quote
      end

      deprecate :quote, 'Faker::Quotes::Yoda.quote', 2018, 12
    end
  end
end
