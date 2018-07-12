# frozen_string_literal: true

module Faker
  class NatoPhoneticAlphabet < Base
    class << self
      def code_word
        fetch('nato_phonetic_alphabet.code_word')
      end
    end
  end
end
