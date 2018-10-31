# frozen_string_literal: true

module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    class << self
      def word
        sample(translate('faker.lorem.words'))
      end

      def words(num = 3, supplemental = false)
        resolved_num = resolve(num)
        word_list = (
          translate('faker.lorem.words') +
          (supplemental ? translate('faker.lorem.supplemental') : [])
        )
        word_list *= ((resolved_num / word_list.length) + 1)
        shuffle(word_list)[0, resolved_num]
      end

      def character
        sample(Types::CHARACTERS)
      end

      def characters(char_count = 255)
        Alphanumeric.alphanumeric(char_count)
      end

      def multibyte
        sample(translate('faker.lorem.multibyte')).pack('C*').force_encoding('utf-8')
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 0)
        words(word_count + rand(random_words_to_add.to_i), supplemental).join(' ').capitalize + locale_period
      end

      def sentences(sentence_count = 3, supplemental = false)
        1.upto(resolve(sentence_count)).collect { sentence(3, supplemental) }
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 0)
        sentences(resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental).join(locale_space)
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        1.upto(resolve(paragraph_count)).collect { paragraph(3, supplemental) }
      end

      def paragraph_by_chars(chars = 256, supplemental = false)
        paragraph = paragraph(3, supplemental)

        paragraph += ' ' + paragraph(3, supplemental) while paragraph.length < chars

        paragraph[0...chars - 1] + '.'
      end

      def question(word_count = 4, supplemental = false, random_words_to_add = 0)
        words(word_count + rand(random_words_to_add), supplemental).join(' ').capitalize + locale_question_mark
      end

      def questions(question_count = 3, supplemental = false)
        1.upto(resolve(question_count)).collect { question(3, supplemental) }
      end

      private

      def locale_period
        translate('faker.lorem.punctuation.period') || '.'
      end

      def locale_space
        translate('faker.lorem.punctuation.space') || ' '
      end

      def locale_question_mark
        translate('faker.lorem.punctuation.question_mark') || '?'
      end
    end
  end
end
