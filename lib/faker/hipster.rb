module Faker
  class Hipster < Base
    class << self
      def word
        random_word = translate('faker.hipster.words').sample
        random_word.match(/\s/) ? word : random_word
      end

      def words(num = 3, supplemental = false, spaces_allowed = false)
        resolved_num = resolve(num)
        word_list = (
          translate('faker.hipster.words') +
          (supplemental ? translate('faker.lorem.words') : [])
        )
        word_list = word_list * ((resolved_num / word_list.length) + 1)

        return word_list.shuffle[0, resolved_num] if spaces_allowed
        words = word_list.shuffle[0, resolved_num]
        words.each_with_index { |w, i| words[i] = word if w.match(/\s/) }
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
        words(word_count + rand(random_words_to_add.to_i).to_i, supplemental, true).join(' ').capitalize + '.'
      end

      def sentences(sentence_count = 3, supplemental = false)
        [].tap do |sentences|
          1.upto(resolve(sentence_count)) do
            sentences << sentence(3, supplemental)
          end
        end
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
        sentences(resolve(sentence_count) + rand(random_sentences_to_add.to_i).to_i, supplemental).join(' ')
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        [].tap do |paragraphs|
          1.upto(resolve(paragraph_count)) do
            paragraphs << paragraph(3, supplemental)
          end
        end
      end

    private

      # If an array or range is passed, a random value will be selected.
      # All other values are simply returned.
      def resolve(value)
        case value
        when Array then value[rand(value.size)]
        when Range then rand((value.last+1) - value.first) + value.first
        else value
        end
      end
    end
  end
end
