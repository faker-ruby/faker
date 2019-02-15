# frozen_string_literal: true

module Faker
  class Lovecraft
    class << self
      extend Gem::Deprecate

      def location
        Faker::Books::Lovecraft.location
      end

      def fhtagn(number_of = 1)
        Faker::Books::Lovecraft.fhtagn(number_of)
      end

      def deity
        Faker::Books::Lovecraft.deity
      end

      def tome
        Faker::Books::Lovecraft.tome
      end

      def sentence(word_count = 4, random_words_to_add = 6)
        Faker::Books::Lovecraft.sentence(word_count, random_words_to_add)
      end

      def word
        Faker::Books::Lovecraft.word
      end

      def words(num = 3, spaces_allowed = false)
        Faker::Books::Lovecraft.words(num, spaces_allowed)
      end

      def sentences(sentence_count = 3)
        Faker::Books::Lovecraft.sentences(sentence_count)
      end

      def paragraph(sentence_count = 3, random_sentences_to_add = 3)
        Faker::Books::Lovecraft.paragraph(sentence_count, random_sentences_to_add)
      end

      def paragraphs(paragraph_count = 3)
        Faker::Books::Lovecraft.paragraphs(paragraph_count)
      end

      def paragraph_by_chars(chars = 256)
        Faker::Books::Lovecraft.paragraph_by_chars(chars)
      end

      deprecate :location, 'Faker::Books::Lovecraft.location', 2019, 01
      deprecate :fhtagn, 'Faker::Books::Lovecraft.fhtagn', 2019, 01
      deprecate :deity, 'Faker::Books::Lovecraft.deity', 2019, 01
      deprecate :tome, 'Faker::Books::Lovecraft.tome', 2019, 01
      deprecate :sentence, 'Faker::Books::Lovecraft.sentence', 2019, 01
      deprecate :word, 'Faker::Books::Lovecraft.word', 2019, 01
      deprecate :words, 'Faker::Books::Lovecraft.words', 2019, 01
      deprecate :sentences, 'Faker::Books::Lovecraft.sentences', 2019, 01
      deprecate :paragraph, 'Faker::Books::Lovecraft.paragraph', 2019, 01
      deprecate :paragraphs, 'Faker::Books::Lovecraft.paragraphs', 2019, 01
      deprecate :paragraph_by_chars, 'Faker::Books::Lovecraft.paragraph_by_chars', 2019, 01
    end
  end
end
