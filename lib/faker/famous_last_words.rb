module Faker
  class FamousLastWords < Base
    flexible :famous_last_words

    class << self
      def name
        fetch('famous_last_words.phrase')
      end
    end
  end
end
