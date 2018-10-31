# frozen_string_literal: true

module Faker
  class Seinfeld < Base
    class << self
      def business
        fetch('seinfeld.business')
      end

      def character
        fetch('seinfeld.character')
      end

      def quote
        fetch('seinfeld.quote')
      end
    end
  end
end
