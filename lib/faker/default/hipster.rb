# frozen_string_literal: true

module Faker
  class Hipster < Base
    class << self
      def word
        random_word = sample(translate('faker.hipster.words'))
        random_word =~ /\s/ ? word : random_word
      end

      # rubocop:disable Metrics/ParameterLists
      def words(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_spaces_allowed = NOT_GIVEN, number: 3, supplemental: false, spaces_allowed: false)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :spaces_allowed if legacy_spaces_allowed != NOT_GIVEN
        end

        resolved_num = resolve(number)
        word_list = (
          translate('faker.hipster.words') +
          (supplemental ? translate('faker.lorem.words') : [])
        )
        word_list *= ((resolved_num / word_list.length) + 1)

        return shuffle(word_list)[0, resolved_num] if spaces_allowed

        words = shuffle(word_list)[0, resolved_num]
        words.each_with_index { |w, i| words[i] = word if w =~ /\s/ }
      end

      # rubocop:disable Metrics/ParameterLists
      def sentence(legacy_word_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, supplemental: false, random_words_to_add: 6)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :word_count if legacy_word_count != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :random_words_to_add if legacy_random_words_to_add != NOT_GIVEN
        end

        words(number: word_count + rand(random_words_to_add.to_i).to_i, supplemental: supplemental, spaces_allowed: true).join(' ').capitalize + '.'
      end

      def sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        [].tap do |sentences|
          1.upto(resolve(number)) do
            sentences << sentence(word_count: 3, supplemental: supplemental)
          end
        end
      end

      # rubocop:disable Metrics/ParameterLists
      def paragraph(legacy_sentence_count = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, supplemental: false, random_sentences_to_add: 3)
        # rubocop:enable Metrics/ParameterLists
        warn_for_deprecated_arguments do |keywords|
          keywords << :sentence_count if legacy_sentence_count != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
          keywords << :random_sentences_to_add if legacy_random_sentences_to_add != NOT_GIVEN
        end

        sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i, supplemental: supplemental).join(' ')
      end

      def paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :number if legacy_number != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        [].tap do |paragraphs|
          1.upto(resolve(number)) do
            paragraphs << paragraph(sentence_count: 3, supplemental: supplemental)
          end
        end
      end

      def paragraph_by_chars(legacy_characters = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, characters: 256, supplemental: false)
        warn_for_deprecated_arguments do |keywords|
          keywords << :characters if legacy_characters != NOT_GIVEN
          keywords << :supplemental if legacy_supplemental != NOT_GIVEN
        end

        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < characters

        paragraph[0...characters - 1] + '.'
      end
    end
  end
end
