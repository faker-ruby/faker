# frozen_string_literal: true

module Faker
  class Quote
    class << self
      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def yoda
        fetch('quote.yoda')
      end
    end
  end
end
