# frozen_string_literal: true

module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    class << self
      def word
        sample(translate('faker.lorem.words'))
      end

      def words(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
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

      ##
      # Produces a random string of alphanumeric characters
      #
      # @param number [Integer] The number of characters to generate
      # @param min_alpha [Integer] The minimum number of alphabetic to add to the string
      # @param min_numeric [Integer] The minimum number of numbers to add to the string
      #
      # @return [String]
      #
      # @example
      #   Faker::Lorem.characters #=> "uw1ep04lhs0c4d931n1jmrspprf5w..."
      #   Faker::Lorem.characters(number: 10) #=> "ang9cbhoa8"
      #   Faker::Lorem.characters(number: 10, min_alpha: 4) #=> "ang9cbhoa8"
      #   Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) #=> "ang9cbhoa8"
      #
      # @faker.version 2.1.3
      def characters(legacy_number = NOT_GIVEN, number: 255, min_alpha: 0, min_numeric: 0)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
        end

        Alphanumeric.alphanumeric(number: number, min_alpha: min_alpha, min_numeric: min_numeric)
      end

      def multibyte
        sample(translate('faker.lorem.multibyte')).pack('C*').force_encoding('utf-8')
      end

      # rubocop:disable Metrics/ParameterLists
      def sentence(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :word_count if legacy_word_count != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :random_words_to_add if legacy_random_words_to_add != NOT_GIVEN
        end

        words(number: word_count + rand(random_words_to_add.to_i), supplemental: supplemental).join(locale_space).capitalize + locale_period
      end

      def sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        1.upto(resolve(number)).collect { sentence(word_count: 3, supplemental: supplemental) }
      end

      # rubocop:disable Metrics/ParameterLists
      def paragraph(legacy_sentence_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, supplemental: false, random_sentences_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :sentence_count if legacy_sentence_count != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :random_sentences_to_add if legacy_random_sentences_to_add != NOT_GIVEN
        end

        sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental: supplemental).join(locale_space)
      end

      def paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        1.upto(resolve(number)).collect { paragraph(sentence_count: 3, supplemental: supplemental) }
      end

      def paragraph_by_chars(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 256, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < number

        paragraph[0...number - 1] + '.'
      end

      # rubocop:disable Metrics/ParameterLists
      def question(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 0)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :word_count if legacy_word_count != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :random_words_to_add if legacy_random_words_to_add != NOT_GIVEN
        end

        words(number: word_count + rand(random_words_to_add), supplemental: supplemental).join(' ').capitalize + locale_question_mark
      end

      def questions(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
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
