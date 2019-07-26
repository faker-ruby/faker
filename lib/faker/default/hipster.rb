# frozen_string_literal: true

module Faker
  class Hipster < Base
    class << self
      def word
        random_word = sample(translate('faker.hipster.words'))
        random_word =~ /\s/ ? word : random_word
      end

      def words(characters: 3, supplemental: false, spaces_allowed: false)
        resolved_num = resolve(characters)
        word_list = (
          translate('faker.hipster.words') +
          (supplemental ? translate('faker.lorem.words') : [])
        )
        word_list *= ((resolved_num / word_list.length) + 1)

        return shuffle(word_list)[0, resolved_num] if spaces_allowed

        words = shuffle(word_list)[0, resolved_num]
        words.each_with_index { |w, i| words[i] = word if w =~ /\s/ }
      end

      def sentence(word_count: 4, supplemental: false, random_words_to_add: 6)
        words(characters: word_count + rand(random_words_to_add.to_i).to_i, supplemental: supplemental, spaces_allowed: true).join(' ').capitalize + '.'
      end

      def sentences(sentence_count: 3, supplemental: false)
        [].tap do |sentences|
          1.upto(resolve(sentence_count)) do
            sentences << sentence(word_count: 3, supplemental: supplemental)
          end
        end
      end

      def paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 3)
        sentences(sentence_count: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i, supplemental: supplemental).join(' ')
      end

      def paragraphs(paragraph_count: 3, supplemental: false)
        [].tap do |paragraphs|
          1.upto(resolve(paragraph_count)) do
            paragraphs << paragraph(sentence_count: 3, supplemental: supplemental)
          end
        end
      end

      def paragraph_by_chars(characters: 256, supplemental: false)
        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < characters

        paragraph[0...characters - 1] + '.'
      end
    end
  end
end
