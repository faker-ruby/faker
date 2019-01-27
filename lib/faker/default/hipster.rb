# frozen_string_literal: true

module Faker
  module Hipster
    class << self
      extend Gem::Deprecate

      def word
        Faker::Lorem::Hipster.word
      end

      def words(num = 3, supplemental = false, spaces_allowed = false)
        Faker::Lorem::Hipster.words(num, supplemental, spaces_allowed)
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
        Faker::Lorem::Hipster.sentence(word_count, supplemental, random_words_to_add)
      end

      def sentences(sentence_count = 3, supplemental = false)
        Faker::Lorem::Hipster.sentences(sentence_count, supplemental)
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
        Faker::Lorem::Hipster.paragraph(sentence_count, supplemental, random_sentences_to_add)
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        Faker::Lorem::Hipster.paragraphs(paragraph_count, supplemental)
      end

      def paragraph_by_chars(chars = 256, supplemental = false)
        Faker::Lorem::Hipster.paragraph_by_chars(chars, supplemental)
      end

      deprecate :word, 'Faker::Lorem::Hipster.word', 2018, 10
      deprecate :words, 'Faker::Lorem::Hipster.words', 2018, 10
      deprecate :sentence, 'Faker::Lorem::Hipster.sentence', 2018, 10
      deprecate :sentences, 'Faker::Lorem::Hipster.sentences', 2018, 10
      deprecate :paragraph, 'Faker::Lorem::Hipster.paragraph', 2018, 10
      deprecate :paragraphs, 'Faker::Lorem::Hipster.paragraphs', 2018, 10
      deprecate :paragraph_by_chars, 'Faker::Lorem::Hipster.paragraph_by_chars', 2018, 10
    end
  end
end
