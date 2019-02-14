# frozen_string_literal: true

module Faker
  class Shakespeare
    class << self
      extend Gem::Deprecate

      def hamlet_quote
        Faker::Quotes::Shakespeare.hamlet_quote
      end

      def as_you_like_it_quote
        Faker::Quotes::Shakespeare.as_you_like_it_quote
      end

      def king_richard_iii_quote
        Faker::Quotes::Shakespeare.king_richard_iii_quote
      end

      def romeo_and_juliet_quote
        Faker::Quotes::Shakespeare.romeo_and_juliet_quote
      end

      def hamlet
        Faker::Quotes::Shakespeare.hamlet
      end

      def as_you_like_it
        Faker::Quotes::Shakespeare.as_you_like_it
      end

      def king_richard_iii
        Faker::Quotes::Shakespeare.king_richard_iii
      end

      def romeo_and_juliet
        Faker::Quotes::Shakespeare.romeo_and_juliet
      end

      deprecate :hamlet_quote, 'Faker::Quotes::Shakespeare.hamlet_quote', 2019, 01
      deprecate :as_you_like_it_quote, 'Faker::Quotes::Shakespeare.as_you_like_it_quote', 2019, 01
      deprecate :king_richard_iii_quote, 'Faker::Quotes::Shakespeare.king_richard_iii_quote', 2019, 01
      deprecate :romeo_and_juliet_quote, 'Faker::Quotes::Shakespeare.romeo_and_juliet_quote', 2019, 01
      deprecate :hamlet, 'Faker::Quotes::Shakespeare.hamlet', 2019, 01
      deprecate :as_you_like_it, 'Faker::Quotes::Shakespeare.as_you_like_it', 2019, 01
      deprecate :king_richard_iii, 'Faker::Quotes::Shakespeare.king_richard_iii', 2019, 01
      deprecate :romeo_and_juliet, 'Faker::Quotes::Shakespeare.romeo_and_juliet', 2019, 01
    end
  end
end
