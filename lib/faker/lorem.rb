module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    CHARACTERS = ('0'..'9').to_a + ('a'..'z').to_a

    class << self
      def word
        translate('faker.lorem.words').sample
      end

      def words(count: 3, supplemental: false)
        resolved_num = resolve(count)
        word_list = (
          translate('faker.lorem.words') +
          (supplemental ? translate('faker.lorem.supplemental') : [])
        )
        word_list = word_list * ((resolved_num / word_list.length) + 1)
        word_list.shuffle[0, resolved_num]
      end

      def character
        CHARACTERS.sample
      end

      def characters(count = 255)
        count = resolve(count)
        return '' if count.to_i < 1
        Array.new(count) { CHARACTERS.sample }.join
      end

      def sentence(word_count: 4, supplemental: false, random_words_to_add: 6)
        words(count: word_count + rand(random_words_to_add.to_i), supplemental: supplemental).join(' ').capitalize + '.'
      end

      def sentences(count: 3, supplemental: false)
        [].tap do |sentences|
          1.upto(resolve(count)) do
            sentences << sentence(word_count: 3, supplemental: supplemental)
          end
        end
      end

      def paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 3)
        sentences(count: resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental: supplemental).join(' ')
      end

      def paragraphs(count: 3, supplemental: false)
        [].tap do |paragraphs|
          1.upto(resolve(count)) do
            paragraphs << paragraph(sentence_count: 3, supplemental: supplemental)
          end
        end
      end

      def question(word_count: 4, supplemental: false, random_words_to_add: 6)
        words(count: word_count + rand(random_words_to_add.to_i).to_i, supplemental: supplemental).join(' ').capitalize + '?'
      end

      def questions(count: 3, supplemental: false)
        [].tap do |questions|
          1.upto(resolve(count)) do
            questions << question(word_count: 3, supplemental: supplemental)
          end
        end
      end

    private

      # If an array or range is passed, a random value will be selected.
      # All other values are simply returned.
      def resolve(value)
        case value
        when Array then value.sample
        when Range then rand value
        else value
        end
      end
    end
  end
end
