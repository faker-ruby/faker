module Faker
  class FamousLastWords < Base
    flexible :famous_last_words

    def last_words
      fetch('famous_last_words.last_words')
    end
  end
end
