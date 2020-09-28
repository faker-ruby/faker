# frozen_string_literal: true

module Faker
  class Quote < Base
    class << self
      ##
      # Produces a famous last words quote.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.famous_last_words #=> "My vocabulary did this to me. Your love will let you go on..."
      #
      # @faker.version 1.9.0
      def famous_last_words
        fetch('quote.famous_last_words')
      end

      ##
      # Produces a quote from Matz.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.matz #=> "You want to enjoy life, don't you? If you get your job done quickly and your job is fun, that's good isn't it? That's the purpose of life, partly. Your life is better."
      #
      # @faker.version 1.9.0
      def matz
        fetch('quote.matz')
      end

      ##
      # Produces a quote about the most interesting man in the world.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.most_interesting_man_in_the_world #=> "He can speak Russian... in French"
      #
      # @faker.version 1.9.0
      def most_interesting_man_in_the_world
        fetch('quote.most_interesting_man_in_the_world')
      end

      ##
      # Produces a Robin quote.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.robin #=> "Holy Razors Edge"
      #
      # @faker.version 1.9.0
      def robin
        fetch('quote.robin')
      end

      ##
      # Produces a singular siegler quote.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.singular_siegler #=> "Texas!"
      #
      # @faker.version 1.9.0
      def singular_siegler
        fetch('quote.singular_siegler')
      end

      ##
      # Produces a quote from Yoda.
      #
      # @return [String]
      #
      # @example
      #   Faker::Quote.yoda #=> "Use your feelings, Obi-Wan, and find him you will."
      #
      # @faker.version 1.9.0
      def yoda
        fetch('quote.yoda')
      end
    end
  end
end
