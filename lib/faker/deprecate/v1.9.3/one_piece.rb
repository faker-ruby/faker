# frozen_string_literal: true

module Faker
  class OnePiece
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

      deprecate :character, 'Faker::JapaneseMedia::OnePiece.character', 2019, 01
      deprecate :sea, 'Faker::JapaneseMedia::OnePiece.sea', 2019, 01
      deprecate :island, 'Faker::JapaneseMedia::OnePiece.island', 2019, 01
      deprecate :location, 'Faker::JapaneseMedia::OnePiece.location', 2019, 01
      deprecate :quote, 'Faker::JapaneseMedia::OnePiece.quote', 2019, 01
      deprecate :akuma_no_mi, 'Faker::JapaneseMedia::OnePiece.akuma_no_mi', 2019, 01
    end
  end
end
