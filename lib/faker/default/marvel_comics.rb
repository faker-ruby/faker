# frozen_string_literal: true

module Faker
  class MarvelComics < Base
    flexible :MarvelComics
    class << self
      def hero
        fetch('marvel_comics.hero')
      end

      def heroine
        fetch('marvel_comics.heroine')
      end

      def villain
        fetch('marvel_comics.villain')
      end

      def name
        fetch('marvel_comics.name')
      end
    end
  end
end
