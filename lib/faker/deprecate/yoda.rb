# frozen_string_literal: true

module Faker
  class Yoda < Base
    class << self
      extend Gem::Deprecate

      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def quote
        Faker::Quote.yoda
      end

      deprecate :quote, 'Faker::Quote.yoda', 2018, 12
    end
  end
end
