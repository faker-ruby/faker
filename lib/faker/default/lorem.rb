# frozen_string_literal: true

module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    class << self
      def word
        sample(translate('faker.lorem.words'))
      end

      def words(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.words` is deprecated. Use keyword argument like `Lorem.words(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.words` is deprecated. Use keyword argument like `Lorem.words(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

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

      def characters(legacy_number = NOT_GIVEN, number: 255)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.characters` is deprecated. Use keyword argument like `Lorem.characters(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end

        Alphanumeric.alphanumeric(number: number)
      end

      def multibyte
        sample(translate('faker.lorem.multibyte')).pack('C*').force_encoding('utf-8')
      end

      # rubocop:disable Metrics/ParameterLists
      def sentence(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        if legacy_word_count != NOT_GIVEN
          warn_with_uplevel 'Passing `word_count` with the 1st argument of `Lorem.sentence` is deprecated. Use keyword argument like `Lorem.sentence(word_count: ...)` instead.', uplevel: 1
          word_count = legacy_word_count
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.sentence` is deprecated. Use keyword argument like `Lorem.sentence(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_random_words_to_add != NOT_GIVEN
          warn_with_uplevel 'Passing `random_words_to_add` with the 3rd argument of `Lorem.sentence` is deprecated. Use keyword argument like `Lorem.sentence(random_words_to_add: ...)` instead.', uplevel: 1
          random_words_to_add = legacy_random_words_to_add
        end

        words(number: word_count + rand(random_words_to_add.to_i), supplemental: supplemental).join(' ').capitalize + locale_period
      end

      def sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.sentences` is deprecated. Use keyword argument like `Lorem.sentences(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.sentences` is deprecated. Use keyword argument like `Lorem.sentences(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

        1.upto(resolve(number)).collect { sentence(word_count: 3, supplemental: supplemental) }
      end

      # rubocop:disable Metrics/ParameterLists
      def paragraph(legacy_sentence_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, supplemental: false, random_sentences_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        if legacy_sentence_count != NOT_GIVEN
          warn_with_uplevel 'Passing `sentence_count` with the 1st argument of `Lorem.paragraph` is deprecated. Use keyword argument like `Lorem.paragraph(sentence_count: ...)` instead.', uplevel: 1
          sentence_count = legacy_sentence_count
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.paragraph` is deprecated. Use keyword argument like `Lorem.paragraph(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_random_sentences_to_add != NOT_GIVEN
          warn_with_uplevel 'Passing `random_sentences_to_add` with the 3rd argument of `Lorem.paragraph` is deprecated. Use keyword argument like `Lorem.paragraph(random_sentences_to_add: ...)` instead.', uplevel: 1
          random_sentences_to_add = legacy_random_sentences_to_add
        end

        sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental: supplemental).join(locale_space)
      end

      def paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.paragraphs` is deprecated. Use keyword argument like `Lorem.paragraphs(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.paragraphs` is deprecated. Use keyword argument like `Lorem.paragraphs(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

        1.upto(resolve(number)).collect { paragraph(sentence_count: 3, supplemental: supplemental) }
      end

      def paragraph_by_chars(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 256, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.paragraph_by_chars` is deprecated. Use keyword argument like `Lorem.paragraph_by_chars(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.paragraph_by_chars` is deprecated. Use keyword argument like `Lorem.paragraph_by_chars(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < number

        paragraph[0...number - 1] + '.'
      end

      # rubocop:disable Metrics/ParameterLists
      def question(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        if legacy_word_count != NOT_GIVEN
          warn_with_uplevel 'Passing `word_count` with the 1st argument of `Lorem.question` is deprecated. Use keyword argument like `Lorem.question(word_count: ...)` instead.', uplevel: 1
          word_count = legacy_word_count
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.question` is deprecated. Use keyword argument like `Lorem.question(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_random_words_to_add != NOT_GIVEN
          warn_with_uplevel 'Passing `random_words_to_add` with the 3rd argument of `Lorem.question` is deprecated. Use keyword argument like `Lorem.question(random_words_to_add: ...)` instead.', uplevel: 1
          random_words_to_add = legacy_random_words_to_add
        end

        words(number: word_count + rand(random_words_to_add), supplemental: supplemental).join(' ').capitalize + locale_question_mark
      end

      def questions(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Lorem.questions` is deprecated. Use keyword argument like `Lorem.questions(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Lorem.questions` is deprecated. Use keyword argument like `Lorem.questions(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

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
