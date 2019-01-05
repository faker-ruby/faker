# frozen_string_literal: true

module Faker
  class Quote
    class Yoga < Base
      class << self
        # from: http://morecoolquotes.com/famous-yoda-quotes/
        def yoga
          fetch('quote.yoda')
        end
      end
    end
  end
end
