# frozen_string_literal: true

module Faker
  class Dota
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

      deprecate :hero, 'Faker::Games::Dota.hero', 2019, 01
      deprecate :item, 'Faker::Games::Dota.item', 2019, 01
      deprecate :team, 'Faker::Games::Dota.team', 2019, 01
      deprecate :player, 'Faker::Games::Dota.player', 2019, 01
      deprecate :quote, 'Faker::Games::Dota.quote', 2019, 01
    end
  end
end
