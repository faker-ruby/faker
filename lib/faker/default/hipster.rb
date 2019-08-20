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
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Hipster.words` is deprecated. Use keyword argument like `Hipster.words(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.words` is deprecated. Use keyword argument like `Hipster.words(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_spaces_allowed != NOT_GIVEN
          warn_with_uplevel 'Passing `spaces_allowed` with the 3rd argument of `Hipster.words` is deprecated. Use keyword argument like `Hipster.words(spaces_allowed: ...)` instead.', uplevel: 1
          spaces_allowed = legacy_spaces_allowed
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
        if legacy_word_count != NOT_GIVEN
          warn_with_uplevel 'Passing `word_count` with the 1st argument of `Hipster.sentence` is deprecated. Use keyword argument like `Hipster.sentence(word_count: ...)` instead.', uplevel: 1
          word_count = legacy_word_count
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.sentence` is deprecated. Use keyword argument like `Hipster.sentence(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_random_words_to_add != NOT_GIVEN
          warn_with_uplevel 'Passing `random_words_to_add` with the 3rd argument of `Hipster.sentence` is deprecated. Use keyword argument like `Hipster.sentence(random_words_to_add: ...)` instead.', uplevel: 1
          random_words_to_add = legacy_random_words_to_add
        end

        words(number: word_count + rand(random_words_to_add.to_i).to_i, supplemental: supplemental, spaces_allowed: true).join(' ').capitalize + '.'
      end

      def sentences(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Hipster.sentences` is deprecated. Use keyword argument like `Hipster.sentences(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.sentences` is deprecated. Use keyword argument like `Hipster.sentences(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
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
        if legacy_sentence_count != NOT_GIVEN
          warn_with_uplevel 'Passing `sentence_count` with the 1st argument of `Hipster.paragraph` is deprecated. Use keyword argument like `Hipster.paragraph(sentence_count: ...)` instead.', uplevel: 1
          sentence_count = legacy_sentence_count
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.paragraph` is deprecated. Use keyword argument like `Hipster.paragraph(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end
        if legacy_random_sentences_to_add != NOT_GIVEN
          warn_with_uplevel 'Passing `random_sentences_to_add` with the 3rd argument of `Hipster.paragraph` is deprecated. Use keyword argument like `Hipster.paragraph(random_sentences_to_add: ...)` instead.', uplevel: 1
          random_sentences_to_add = legacy_random_sentences_to_add
        end

        sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i, supplemental: supplemental).join(' ')
      end

      def paragraphs(legacy_number = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, number: 3, supplemental: false)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Hipster.paragraphs` is deprecated. Use keyword argument like `Hipster.paragraphs(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.paragraphs` is deprecated. Use keyword argument like `Hipster.paragraphs(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

        [].tap do |paragraphs|
          1.upto(resolve(number)) do
            paragraphs << paragraph(sentence_count: 3, supplemental: supplemental)
          end
        end
      end

      def paragraph_by_chars(legacy_characters = NOT_GIVEN, legacy_supplemental = NOT_GIVEN, characters: 256, supplemental: false)
        if legacy_characters != NOT_GIVEN
          warn_with_uplevel 'Passing `characters` with the 1st argument of `Hipster.paragraph_by_chars` is deprecated. Use keyword argument like `Hipster.paragraph_by_chars(characters: ...)` instead.', uplevel: 1
          characters = legacy_characters
        end
        if legacy_supplemental != NOT_GIVEN
          warn_with_uplevel 'Passing `supplemental` with the 2nd argument of `Hipster.paragraph_by_chars` is deprecated. Use keyword argument like `Hipster.paragraph_by_chars(supplemental: ...)` instead.', uplevel: 1
          supplemental = legacy_supplemental
        end

        paragraph = paragraph(sentence_count: 3, supplemental: supplemental)

        paragraph += ' ' + paragraph(sentence_count: 3, supplemental: supplemental) while paragraph.length < characters

        paragraph[0...characters - 1] + '.'
      end
    end
  end
end
