# frozen_string_literal: true

module Faker
  module SwordArtOnline
    class << self
      extend Gem::Deprecate

      def real_name
        Faker::JapaneseMedia::SwordArtOnline.real_name
      end

      def game_name
        Faker::JapaneseMedia::SwordArtOnline.game_name
      end

      def location
        Faker::JapaneseMedia::SwordArtOnline.location
      end

      def item
        Faker::JapaneseMedia::SwordArtOnline.item
      end

      deprecate :real_name, 'Faker::JapaneseMedia::SwordArtOnline.real_name', 2018, 12
      deprecate :game_name, 'Faker::JapaneseMedia::SwordArtOnline.game_name', 2018, 12
      deprecate :location, 'Faker::JapaneseMedia::SwordArtOnline.location', 2018, 12
      deprecate :item, 'Faker::JapaneseMedia::SwordArtOnline.item', 2018, 12
    end
  end
end
