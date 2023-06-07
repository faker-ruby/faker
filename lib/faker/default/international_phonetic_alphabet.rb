# frozen_string_literal: true

module Faker
  class InternationalPhoneticAlphabet < Base

    class << self

      ##
      # Produces random symbols for consonants in the international phonetic alphabet
      #
      # @param amount [Integer] The number of consonants to generate
      #
      # @return [String]
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.consonant             #=> "ʂ"
      #   Faker::InternationalPhoneticAlphabet.consonant(amount: 3)  #=> "fʕŋ"
      #
      # @faker.version next
      def consonant(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.consonants')}.join
      end

      ##
      # Produces random symbols for vowels in the international phonetic alphabet
      #
      # @param amount [Integer] The number of vowels to generate
      #
      # @return [String]
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.vowel                 #=> "ɞ"
      #   Faker::InternationalPhoneticAlphabet.vowel(amount: 3)      #=> "əæɜ"
      #
      # @faker.version next
      def vowel(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.vowels')}.join
      end

      ##
      # Produces random symbols for characters in the international phonetic alphabet
      #
      # @param amount [Integer] The number of characters to generate
      #
      # @return [String]
      #
      # @example
      #   Faker::InternationalPhoneticAlphabet.character                 #=> "ʋ"
      #   Faker::InternationalPhoneticAlphabet.character(amount: 3)      #=> "ɜʐd"
      #
      # @faker.version next
      def character(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.characters')}.join
      end

    end
  end
end