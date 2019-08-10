# frozen_string_literal: true

module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    class << self
      def word
        sample(translate('faker.lorem.words'))
      end

      def words(number: 3, supplemental: false)
        resolved_num = resolve(number)
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

      def characters(number: 255)
        Alphanumeric.alphanumeric(number: number)
      end

      def multibyte
        sample(translate('faker.lorem.multibyte')).pack('C*').force_encoding('utf-8')
      end

      def sentence(word_count: 4, supplemental: false, random_words_to_add: 0)
        words(number: word_count + rand(random_words_to_add.to_i), supplemental: supplemental).join(' ').capitalize + locale_period
      end

      def sentences(number: 3, supplemental: false)
        1.upto(resolve(number)).collect { sentence(word_count: 3, supplemental: supplemental) }
      end

      def paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 0)
        sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental: supplemental).join(locale_space)
      end

      def paragraphs(number: 3, supplemental: false)
        1.upto(resolve(number)).collect { paragraph(sentence_count: 3, supplemental: supplemental) }
      end

      def paragraph_by_chars(number: 256, supplemental: false)
        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < number

        paragraph[0...number - 1] + '.'
      end

      def question(word_count: 4, supplemental: false, random_words_to_add: 0)
        words(number: word_count + rand(random_words_to_add), supplemental: supplemental).join(' ').capitalize + locale_question_mark
      end

      def questions(number: 3, supplemental: false)
        1.upto(resolve(number)).collect { question(word_count: 3, supplemental: supplemental) }
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
