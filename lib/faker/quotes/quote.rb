# frozen_string_literal: true

module Faker
  class Quote < Base
    class << self
      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def yoda
        fetch('quote.yoda')
      end
    end
  end
end
