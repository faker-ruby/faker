module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    CHARACTERS = ('0'..'9').to_a + ('a'..'z').to_a

    class << self
      def word
        translate('faker.lorem.words').sample
      end

      def words(num = 3, supplemental = false)
        resolved_num = resolve(num)
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

      def characters(char_count = 255)
        char_count = resolve(char_count)
        return '' if char_count.to_i < 1
        Array.new(char_count) { CHARACTERS.sample }.join
      end

      def sentence(word_count = 4, supplemental = false, random_words_to_add = 6)
        words(word_count + rand(random_words_to_add.to_i), supplemental).join(' ').capitalize + '.'
      end

      def sentences(sentence_count = 3, supplemental = false)
        1.upto(resolve(sentence_count)).collect { sentence(3, supplemental) }
      end

      def paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
        sentences(resolve(sentence_count) + rand(random_sentences_to_add.to_i), supplemental).join(' ')
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        1.upto(resolve(paragraph_count)).collect { paragraph(3, supplemental) }
      end

      def question(word_count = 4, supplemental = false, random_words_to_add = 6)
        words(word_count + rand(random_words_to_add.to_i).to_i, supplemental).join(' ').capitalize + '?'
      end

      def questions(question_count = 3, supplemental = false)
        1.upto(resolve(question_count)).collect { question(3, supplemental) }
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
