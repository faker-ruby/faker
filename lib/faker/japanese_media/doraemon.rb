# frozen_string_literal: true

module Faker
  class JapaneseMedia
    class Doraemon < Base
      class << self
        ##
        # Produces a character from Doraemon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::Doraemon.character #=> "Nobita"
        #
        # @faker.version 1.8.5
        def character
          fetch('doraemon.characters')
        end

        ##
        # Produces a gadget from Doraemon.
        #
        # @return [String]
        #
        # @example
        #   Faker::JapaneseMedia::Doraemon.gadget #=> "Anywhere Door"
        #
        # @faker.version 1.8.5
        def character
          fetch('one_piece.gadgets')
        end
        
      end
    end
  end
end