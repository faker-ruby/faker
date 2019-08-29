# frozen_string_literal: true

module Faker
  class Books
    class Lovecraft < Base
      class << self
        def location
          fetch('lovecraft.location')
        end

        def fhtagn(legacy_number = NOT_GIVEN, number: 1)
          if legacy_number != NOT_GIVEN
            warn_with_uplevel 'Passing `number` with the 1st argument of `Lovecraft.fhtagn` is deprecated. Use keyword argument like `Lovecraft.fhtagn(number: ...)` instead.', uplevel: 1
            number = legacy_number
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
          if legacy_word_count != NOT_GIVEN
            warn_with_uplevel 'Passing `word_count` with the 1st argument of `Lovecraft.sentence` is deprecated. Use keyword argument like `Lovecraft.sentence(word_count: ...)` instead.', uplevel: 1
            word_count = legacy_word_count
          end
          if legacy_random_words_to_add != NOT_GIVEN
            warn_with_uplevel 'Passing `random_words_to_add` with the 2nd argument of `Lovecraft.sentence` is deprecated. Use keyword argument like `Lovecraft.sentence(random_words_to_add: ...)` instead.', uplevel: 1
            random_words_to_add = legacy_random_words_to_add
          end

          words(number: word_count + rand(random_words_to_add.to_i).to_i, spaces_allowed: true).join(' ').capitalize + '.'
        end

        def word
          random_word = sample(translate('faker.lovecraft.words'))
          random_word =~ /\s/ ? word : random_word
        end

        def words(legacy_number = NOT_GIVEN, legacy_spaces_allowed = NOT_GIVEN, number: 3, spaces_allowed: false)
          if legacy_number != NOT_GIVEN
            warn_with_uplevel 'Passing `number` with the 1st argument of `Lovecraft.words` is deprecated. Use keyword argument like `Lovecraft.words(number: ...)` instead.', uplevel: 1
            number = legacy_number
          end
          if legacy_spaces_allowed != NOT_GIVEN
            warn_with_uplevel 'Passing `spaces_allowed` with the 2nd argument of `Lovecraft.words` is deprecated. Use keyword argument like `Lovecraft.words(spaces_allowed: ...)` instead.', uplevel: 1
            spaces_allowed = legacy_spaces_allowed
          end

          resolved_num = resolve(number)
          word_list = translate('faker.lovecraft.words')
          word_list *= ((resolved_num / word_list.length) + 1)

          return shuffle(word_list)[0, resolved_num] if spaces_allowed

          words = shuffle(word_list)[0, resolved_num]
          words.each_with_index { |w, i| words[i] = word if w =~ /\s/ }
        end

        def sentences(legacy_number = NOT_GIVEN, number: 3)
          if legacy_number != NOT_GIVEN
            warn_with_uplevel 'Passing `number` with the 1st argument of `Lovecraft.sentences` is deprecated. Use keyword argument like `Lovecraft.sentences(number: ...)` instead.', uplevel: 1
            number = legacy_number
          end

          [].tap do |sentences|
            1.upto(resolve(number)) do
              sentences << sentence(word_count: 3)
            end
          end
        end

        def paragraph(legacy_sentence_count = NOT_GIVEN, legacy_random_sentences_to_add = NOT_GIVEN, sentence_count: 3, random_sentences_to_add: 3)
          if legacy_sentence_count != NOT_GIVEN
            warn_with_uplevel 'Passing `sentence_count` with the 1st argument of `Lovecraft.paragraph` is deprecated. Use keyword argument like `Lovecraft.paragraph(sentence_count: ...)` instead.', uplevel: 1
            sentence_count = legacy_sentence_count
          end
          if legacy_random_sentences_to_add != NOT_GIVEN
            warn_with_uplevel 'Passing `random_sentences_to_add` with the 2nd argument of `Lovecraft.paragraph` is deprecated. Use keyword argument like `Lovecraft.paragraph(random_sentences_to_add: ...)` instead.', uplevel: 1
            random_sentences_to_add = legacy_random_sentences_to_add
          end

          sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i).join(' ')
        end

        def paragraphs(legacy_number = NOT_GIVEN, number: 3)
          if legacy_number != NOT_GIVEN
            warn_with_uplevel 'Passing `number` with the 1st argument of `Lovecraft.paragraphs` is deprecated. Use keyword argument like `Lovecraft.paragraphs(number: ...)` instead.', uplevel: 1
            number = legacy_number
          end

          [].tap do |paragraphs|
            1.upto(resolve(number)) do
              paragraphs << paragraph(sentence_count: 3)
            end
          end
        end

        def paragraph_by_chars(legacy_characters = NOT_GIVEN, characters: 256)
          if legacy_characters != NOT_GIVEN
            warn_with_uplevel 'Passing `characters` with the 1st argument of `Lovecraft.paragraph_by_chars` is deprecated. Use keyword argument like `Lovecraft.paragraph_by_chars(characters: ...)` instead.', uplevel: 1
            characters = legacy_characters
          end

          paragraph = paragraph(sentence_count: 3)

          paragraph += ' ' + paragraph(sentence_count: 3) while paragraph.length < characters

          paragraph[0...characters - 1] + '.'
        end
      end
    end
  end
end
