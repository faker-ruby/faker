# frozen_string_literal: true

module Faker
  module Lorem
    class << self
      extend Gem::Deprecate

      def word
        Faker::Lorem::Ipsum.word
      end

      def words(num = 3, supplemental = false)
        Faker::Lorem::Ipsum.words(num, supplemental)
      end

      def character
        Faker::Lorem::Ipsum.character
      end

      def characters(char_count = 255)
        Faker::Lorem::Ipsum.characters(char_count)
      end

      def multibyte
        Faker::Lorem::Ipsum.multibyte
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 0)
        Faker::Lorem::Ipsum.sentence(word_count, supplemental, random_words_to_add)
      end

      def sentences(sentence_count = 3, supplemental = false)
        Faker::Lorem::Ipsum.sentences(sentence_count, supplemental)
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 0)
        Faker::Lorem::Ipsum.paragraph(sentence_count, supplemental, random_sentences_to_add)
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        Faker::Lorem::Ipsum.paragraphs(paragraph_count, supplemental)
      end

      def paragraph_by_chars(chars = 256, supplemental = false)
        Faker::Lorem::Ipsum.paragraph_by_chars(chars, supplemental)
      end

      def question(word_count = 4, supplemental = false, random_words_to_add = 0)
        Faker::Lorem::Ipsum.question(word_count, supplemental, random_words_to_add)
      end

      def questions(question_count = 3, supplemental = false)
        Faker::Lorem::Ipsum.questions(question_count, supplemental)
      end

      deprecate :word, 'Faker::Lorem::Ipsum.word', 2018, 10
      deprecate :words, 'Faker::Lorem::Ipsum.words', 2018, 10
      deprecate :character, 'Faker::Lorem::Ipsum.character', 2018, 10
      deprecate :multibyte, 'Faker::Lorem::Ipsum.multibyte', 2018, 10
      deprecate :sentence, 'Faker::Lorem::Ipsum.sentence', 2018, 10
      deprecate :sentences, 'Faker::Lorem::Ipsum.sentences', 2018, 10
      deprecate :paragraph, 'Faker::Lorem::Ipsum.paragraph', 2018, 10
      deprecate :paragraphs, 'Faker::Lorem::Ipsum.paragraphs', 2018, 10
      deprecate :paragraph_by_chars, 'Faker::Lorem::Ipsum.paragraph_by_chars', 2018, 10
      deprecate :question, 'Faker::Lorem::Ipsum.question', 2018, 10
      deprecate :questions, 'Faker::Lorem::Ipsum.questions', 2018, 10
    end
  end
end
