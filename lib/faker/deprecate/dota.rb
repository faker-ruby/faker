# frozen_string_literal: true

module Faker
  module Dota
    class << self
      extend Gem::Deprecate

      def hero
        Faker::Games::Dota.hero
      end

      def item
        Faker::Games::Dota.item
      end

      def team
        Faker::Games::Dota.team
      end

      def player
        Faker::Games::Dota.player
      end

      def quote(hero = 'abaddon')
        Faker::Games::Dota.quote(hero: hero)
      end

      deprecate :hero, 'Faker::Games::Dota.hero', 2018, 12
      deprecate :item, 'Faker::Games::Dota.item', 2018, 12
      deprecate :team, 'Faker::Games::Dota.team', 2018, 12
      deprecate :player, 'Faker::Games::Dota.player', 2018, 12
      deprecate :quote, 'Faker::Games::Dota.quote', 2018, 12
    end
  end
end
