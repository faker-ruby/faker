# frozen_string_literal: true

module Faker
  class FamousLastWords
    class << self
      extend Gem::Deprecate

      def last_words
        Faker::Quote.famous_last_words
      end

      deprecate :last_words, 'Faker::Quote.famous_last_words', 2019, 01
    end
  end
end
