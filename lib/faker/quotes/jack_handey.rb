# frozen_string_literal: true

module Faker
  class Quotes
    class JackHandey < Base
      class << self
        ##
        # Produces a Deep Thoughts quote from Jack Handey.
        #
        # @return [String]
        #
        # @example
        #   Faker::Quotes::JackHandey.deep_thoughts # => "I hope life isn't a big joke, because I don't get it"
        #
        # @faker.version next
        def deep_thoughts
          fetch('jack_handey.deep_thoughts')
        end
      end
    end
  end
end
