# frozen_string_literal: true

module Faker
  class MarvelComics < Base
    class << self
    def self.hero
      fetch('marvel_comics.hero')
    end

    def self.heroine
      fetch('marvel_comics.heroine')
    end

    def self.villain
      fetch('marvel_comics.villain')
    end

    def self.name
      fetch('marvel_comics.name')
    end
  end
end
