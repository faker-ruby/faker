# frozen_string_literal: true

module Faker
  class Verb < Base
    class << self
      ##
      # Produces the base form of a verb.
      #
      # @return [String]
      #
      # @example
      #   Faker::Verb.base #=> "shape"
      #
      # @faker.version 1.9.0
      def base
        fetch('verbs.base')
      end

      ##
      # Produces the past form of a verb.
      #
      # @return [String]
      #
      # @example
      #   Faker::Verbs.past #=> "motivated"
      #
      # @faker.version 1.9.0
      def past
        fetch('verbs.past')
      end

      ##
      # Produces the past participle form of a verb.
      #
      # @return [String]
      #
      # @example
      #   Faker::Verbs.past_participle #=> "buzzed"
      #
      # @faker.version 1.9.0
      def past_participle
        fetch('verbs.past_participle')
      end

      ##
      # Produces the simple_present form of a verb.
      #
      # @return [String]
      #
      # @example
      #   Faker::Verbs.simple_present #=> "gets"
      #
      # @faker.version 1.9.0
      def simple_present
        fetch('verbs.simple_present')
      end

      ##
      # Produces the -ing form of a verb.
      #
      # @return [String]
      #
      # @example
      #   Faker::Verbs.ing_form #=> "climbing"
      #
      # @faker.version 1.9.0
      def ing_form
        fetch('verbs.ing_form')
      end
    end
  end
end
