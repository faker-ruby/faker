# frozen_string_literal: true

module Faker
  module TV
    class Simpsons < Base
      def self.character
        fetch('simpsons.characters')
      end

      def self.location
        fetch('simpsons.locations')
      end

      def self.quote
        fetch('simpsons.quotes')
      end
    end
  end
end
