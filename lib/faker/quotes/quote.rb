# frozen_string_literal: true

module Faker
  class Quote < Base
    class << self
      def famous_last_words
        fetch('quote.famous_last_words')
      end

      def matz
        fetch('quote.matz')
      end

      def most_interesting_man_in_the_world
        fetch('quote.most_interesting_man_in_the_world')
      end

      def robin
        fetch('quote.robin')
      end

      def singular_siegler
        fetch('quote.singular_siegler')
      end

      # from: http://morecoolquotes.com/famous-yoda-quotes/
      def yoda
        fetch('quote.yoda')
      end
    end
  end
end
