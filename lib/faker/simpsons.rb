#encoding: utf-8
#frozen_string_literal: true

module Faker

  class Simpsons < Base

    def self.character
      fetch('simpsons.characters')
    end

    def self.location
      fetch('simpsons.locations')
    end

    def self.quote
      fetch('simpsons.quotes')
    end

  end #class Simpsons

end #module Faker
