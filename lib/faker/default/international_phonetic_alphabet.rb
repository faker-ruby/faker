# frozen_string_literal: true

module Faker
  class InternationalPhoneticAlphabet < Base

    class << self

      def consonant(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.consonants')}.join
      end

      def vowel(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.vowels')}.join
      end

      def character(amount: 1)
        (1..amount).map{fetch('international_phonetic_alphabet.characters')}.join
      end

    end
  end
end