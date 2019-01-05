# frozen_string_literal: true

module Faker
  class Shakespeare < Base
    class << self
      extend Gem::Deprecate

      def hamlet_quote
        sample(hamlet)
      end

      def as_you_like_it_quote
        sample(as_you_like_it)
      end

      def king_richard_iii_quote
        sample(king_richard_iii)
      end

      def romeo_and_juliet_quote
        sample(romeo_and_juliet)
      end

      def hamlet
        fetch('shakespeare.hamlet')
      end

      def as_you_like_it
        fetch('shakespeare.as_you_like_it')
      end

      def king_richard_iii
        fetch('shakespeare.king_richard_iii')
      end

      def romeo_and_juliet
        fetch('shakespeare.romeo_and_juliet')
      end

      deprecate :hamlet_quote, 'Faker::Quotes::Shakespeare.hamlet_quote', 2018, 12
      deprecate :as_you_like_it_quote, 'Faker::Quotes::Shakespeare.as_you_like_it_quote', 2018, 12
      deprecate :king_richard_iii_quote, 'Faker::Quotes::Shakespeare.king_richard_iii_quote', 2018, 12
      deprecate :romeo_and_juliet_quote, 'Faker::Quotes::Shakespeare.romeo_and_juliet_quote', 2018, 12
      deprecate :hamlet, 'Faker::Quotes::Shakespeare.hamlet', 2018, 12
      deprecate :as_you_like_it, 'Faker::Quotes::Shakespeare.as_you_like_it', 2018, 12
      deprecate :king_richard_iii, 'Faker::Quotes::Shakespeare.king_richard_iii', 2018, 12
      deprecate :romeo_and_juliet, 'Faker::Quotes::Shakespeare.romeo_and_juliet', 2018, 12
    end
  end
end
