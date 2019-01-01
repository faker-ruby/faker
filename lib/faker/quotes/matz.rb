# frozen_string_literal: true

module Faker
  class Quotes
    class Matz < Base
      class << self
        def quote
          fetch('matz.quotes')
        end
      end
    end
  end
end
