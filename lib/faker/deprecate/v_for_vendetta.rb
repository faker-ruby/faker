# frozen_string_literal: true

module Faker
  class VForVendetta < Base
    class << self
      extend Gem::Deprecate

      def character
        Faker::Movies::VForVendetta.character
      end

      def speech
        Faker::Movies::VForVendetta.speech
      end

      def quote
        Faker::Movies::VForVendetta.quote
      end

      deprecate :character, 'Faker::Movies::VForVendetta.character', 2018, 12
      deprecate :speech, 'Faker::Movies::VForVendetta.speech', 2018, 12
      deprecate :quote, 'Faker::Movies::VForVendetta.quote', 2018, 12
    end
  end
end
