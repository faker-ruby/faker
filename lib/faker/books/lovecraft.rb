# frozen_string_literal: true

module Faker
  class Books
    class Lovecraft < Base
      class << self
        def location
          fetch('lovecraft.location')
        end

        def fhtagn(number: 1)
          Array.new(number) { fetch('lovecraft.fhtagn') }.join('. ')
        end

        def deity
          fetch('lovecraft.deity')
        end

        def tome
          fetch('lovecraft.tome')
        end

        def sentence(word_count: 4, random_words_to_add: 6)
          words(number: word_count + rand(random_words_to_add.to_i).to_i, spaces_allowed: true).join(' ').capitalize + '.'
        end

        def word
          random_word = sample(translate('faker.lovecraft.words'))
          random_word =~ /\s/ ? word : random_word
        end

        def words(number: 3, spaces_allowed: false)
          resolved_num = resolve(number)
          word_list = translate('faker.lovecraft.words')
          word_list *= ((resolved_num / word_list.length) + 1)

          return shuffle(word_list)[0, resolved_num] if spaces_allowed

          words = shuffle(word_list)[0, resolved_num]
          words.each_with_index { |w, i| words[i] = word if w =~ /\s/ }
        end

        def sentences(number: 3)
          [].tap do |sentences|
            1.upto(resolve(number)) do
              sentences << sentence(word_count: 3)
            end
          end
        end

        def paragraph(sentence_count: 3, random_sentences_to_add: 3)
          sentences(number: resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i).join(' ')
        end

        def paragraphs(number: 3)
          [].tap do |paragraphs|
            1.upto(resolve(number)) do
              paragraphs << paragraph(sentence_count: 3)
            end
          end
        end

        def paragraph_by_chars(characters: 256)
          paragraph = paragraph(sentence_count: 3)

          paragraph += ' ' + paragraph(sentence_count: 3) while paragraph.length < characters

          paragraph[0...characters - 1] + '.'
        end
      end
    end
  end
end
