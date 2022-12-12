# frozen_string_literal: true

module Faker
  class Emoji < Base
    class << self
      ##
      # Produces a random emoji from smileys and emotion category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.smileys_and_emotion #=> "😀"
      #
      # @faker.version next
      def smileys_and_emotion
        fetch('emoji.smileys_and_emotion')
      end

      ##
      # Produces a random emoji from people and body category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.people_and_body #=> "👋"
      #
      # @faker.version next
      def people_and_body
        fetch('emoji.people_and_body')
      end

      ##
      # Produces a random emoji from animals and nature category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.animals_and_nature #=> "🐒"
      #
      # @faker.version next
      def animals_and_nature
        fetch('emoji.animals_and_nature')
      end

      ##
      # Produces a random emoji from the food and drink category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.food_and_drink #=> "🍌"
      #
      # @faker.version next
      def food_and_drink
        fetch('emoji.food_and_drink')
      end

      ##
      # Produces a random emoji from the traven and places category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.travel_and_places #=> "🌍"
      #
      # @faker.version next
      def travel_and_places
        fetch('emoji.travel_and_places')
      end

      ##
      # Produces a random emoji from the activities category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.activities #=> "⚾"
      #
      # @faker.version next
      def activities
        fetch('emoji.activities')
      end

      ##
      # Produces a random emoji from the objects category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.objects #=> "👕"
      #
      # @faker.version next
      def objects
        fetch('emoji.objects')
      end

      ##
      # Produces a random emoji from the symbols category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.symbols #=> "⛔"
      #
      # @faker.version next
      def symbols
        fetch('emoji.symbols')
      end

      ##
      # Produces a random emoji from the flags category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.flags #=> "🏳️‍🌈"
      #
      # @faker.version next
      def flags
        fetch('emoji.flags')
      end

      ##
      # Produces a random emoji from any category.
      #
      # @return [String]
      #
      # @example
      #   Faker::Emoji.emoji #=> "💘"
      #
      # @faker.version next
      def emoji
        parse('emoji.emoji')
      end
    end
  end
end
