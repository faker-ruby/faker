# frozen_string_literal: true

module Faker
  module OnePiece
    class << self
      extend Gem::Deprecate

      def character
        Faker::JapaneseMedia::OnePiece.character
      end

      def sea
        Faker::JapaneseMedia::OnePiece.sea
      end

      def island
        Faker::JapaneseMedia::OnePiece.island
      end

      def location
        Faker::JapaneseMedia::OnePiece.location
      end

      def quote
        Faker::JapaneseMedia::OnePiece.quote
      end

      def akuma_no_mi
        Faker::JapaneseMedia::OnePiece.akuma_no_mi
      end

      deprecate :character, 'Faker::JapaneseMedia::OnePiece.character', 2018, 12
      deprecate :sea, 'Faker::JapaneseMedia::OnePiece.sea', 2018, 12
      deprecate :island, 'Faker::JapaneseMedia::OnePiece.island', 2018, 12
      deprecate :location, 'Faker::JapaneseMedia::OnePiece.location', 2018, 12
      deprecate :quote, 'Faker::JapaneseMedia::OnePiece.quote', 2018, 12
      deprecate :akuma_no_mi, 'Faker::JapaneseMedia::OnePiece.akuma_no_mi', 2018, 12
    end
  end
end
