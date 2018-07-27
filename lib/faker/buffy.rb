# frozen_string_literal: true

module Faker
  class Buffy < Base
    class << self
      def character
        fetch('buffy.characters')
      end

      def quote
        fetch('buffy.quotes')
      end

      def celebrity
        fetch('buffy.celebrities')
      end

      def big_bad
        fetch('buffy.celebrities')
      end

      def episode
        fetch('buffy.celebrities')
      end
    end
  end
end
