module Faker
  # Based on Faker's Lorem
  class Hodor
    class << self
      def word
        'hodor'
      end

      def words(num = 3)
        [word] * resolve(num)
      end

      def sentence(word_count = 4, random_words_to_add = 6)
        (words(word_count) + words(0..random_words_to_add)).join(' ').capitalize + '.'
      end

      def sentences(sentence_count = 3)
        [].tap do |sentences|
          resolve(sentence_count).times do
            sentences << sentence
          end
        end
      end

      def paragraph(sentence_count = 3, random_sentences_to_add = 3)
        [sentences(sentence_count), sentences(0..random_sentences_to_add)].join(' ')
      end

      def paragraphs(paragraph_count = 3)
        [].tap do |paragraphs|
          resolve(paragraph_count).times do
            paragraphs << paragraph(3)
          end
        end
      end

    private

      # If an array or range is passed, a random value will be selected.
      # All other values are simply returned.
      def resolve(value)
        case value
        when Array then value.sample
        when Range then value.to_a.sample
        else value
        end
      end
    end
  end
end
