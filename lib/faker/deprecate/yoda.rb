# frozen_string_literal: true

module Faker
  class Yoda < Base
    class << self
      extend Gem::Deprecate

      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def quote
        Faker::Quote.yoda
      end

      deprecate :quote, 'Faker::Quote.yoda', 2019, 0o1
    end
  end
end
