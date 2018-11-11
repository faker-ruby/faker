# frozen_string_literal: true

module Faker
  class DcComics < Base
    def self.hero
      fetch('dc_comics.hero')
    end

    def self.heroine
      fetch('dc_comics.heroine')
    end

    def self.villain
      fetch('dc_comics.villain')
    end

    def self.name
      fetch('dc_comics.name')
    end

    def self.title
      fetch('dc_comics.title')
    end
  end
end
