# frozen_string_literal: true

module Faker
  class Books
    class Lovecraft < Base
      class << self
        def location
          fetch('lovecraft.location')
        end

        def fhtagn(legacy_number = NOT_GIVEN, number: 1)
          warn_for_deprecated_arguments do |keywords|
            keywords << :number if legacy_number != NOT_GIVEN
          end

          Array.new(number) { fetch('lovecraft.fhtagn') }.join('. ')
        end

        def deity
          fetch('lovecraft.deity')
        end

        def tome
          fetch('lovecraft.tome')
        end

        def sentence(legacy_word_count = NOT_GIVEN, legacy_random_words_to_add = NOT_GIVEN, word_count: 4, random_words_to_add: 6)
          warn_for_deprecated_arguments do |keywords|
            keywords << :word_count if legacy_word_count != NOT_GIVEN
            keywords << :random_words_to_add if legacy_random_words_to_add != NOT_GIVEN
          end

          words(number: word_count + rand(random_words_to_add.to_i).to_i, spaces_allowed: true).join(' ').capitalize + '.'
        end

        def word
          random_word = sample(translate('faker.lovecraft.words'))
          random_word =~ /\s/ ? word : random_word
        end

        def words(legacy_number = NOT_GIVEN, legacy_spaces_allowed = NOT_GIVEN, number: 3, spaces_allowed: false)
          warn_for_deprecated_arguments do |keywords|
            keywords << :number if legacy_number != NOT_GIVEN
            keywords << :spaces_allowed if legacy_spaces_allowed != NOT_GIVEN
          end

          resolved_num = resolve(number)
          word_list = translate('faker.lovecraft.words')
          word_list *= ((resolved_num / word_list.length) + 1)

          return shuffle(word_list)[0, resolved_num] if spaces_allowed

          words = shuffle(word_list)[0, resolved_num]
          words.each_with_index { |w, i| words[i] = word if w =~ /\s/ }
        end

        def sentences(legacy_number = NOT_GIVEN, number: 3)
          warn_for_deprecated_arguments do |keywords|
            keywords << :number if legacy_number != NOT_GIVEN
          end

          [].tap do |sentences|
            1.upto(resolve(number)) do
              sentences << sentence(word_count: 3)
            end
          end
        end

        def paragraph(legacy_sentence_count = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, random_sentences_to_add: 3)
          warn_for_deprecated_arguments do |keywords|
            keywords << :sentence_count if legacy_sentence_count != NOT_GIVEN
            keywords << :random_sentences_to_add if legacy_random_sentences_to_add != NOT_GIVEN
          end

          sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i).join(' ')
        end

        def paragraphs(legacy_number = NOT_GIVEN, number: 3)
          warn_for_deprecated_arguments do |keywords|
            keywords << :number if legacy_number != NOT_GIVEN
          end

          [].tap do |paragraphs|
            1.upto(resolve(number)) do
              paragraphs << paragraph(sentence_count: 3)
            end
          end
        end

        def paragraph_by_chars(legacy_characters = NOT_GIVEN, characters: 256)
          warn_for_deprecated_arguments do |keywords|
            keywords << :characters if legacy_characters != NOT_GIVEN
          end

          paragraph = paragraph(sentence_count: 3)

          paragraph += ' ' + paragraph(sentence_count: 3) while paragraph.length < characters

          paragraph[0...characters - 1] + '.'
        end
      end
    end
  end
end
