# frozen_string_literal: true

module Faker
  class FamousLastWords < Base
    flexible :famous_last_words

    class << self
      extend Gem::Deprecate

      def last_words
        Faker::Quotes::FamousLastWords.last_words
      end

      deprecate :last_words, 'Faker::Quotes::FamousLastWords.last_words', 2018, 12
    end
  end
end
