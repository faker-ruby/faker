# frozen_string_literal: true

module Faker
  class VForVendetta
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

      deprecate :character, 'Faker::Movies::VForVendetta.character', 2019, 01
      deprecate :speech, 'Faker::Movies::VForVendetta.speech', 2019, 01
      deprecate :quote, 'Faker::Movies::VForVendetta.quote', 2019, 01
    end
  end
end
