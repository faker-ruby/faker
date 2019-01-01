# frozen_string_literal: true

module Faker
  class Quotes
    class FamousLastWords < Base
      flexible :famous_last_words

      class << self
        def last_words
          fetch('famous_last_words.last_words')
        end
      end
    end
  end
end
