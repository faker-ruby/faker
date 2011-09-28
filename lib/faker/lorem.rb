module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    class << self
      def word
        translate('faker.lorem.words').sample
      end

      def words(num = 3, supplemental = false)
        (
          translate('faker.lorem.words') +
          (supplemental ? translate('faker.lorem.supplemental') : [])
        ).shuffle[0, resolve(num)]
      end

      def characters(char_count = 255)
        return '' if char_count.respond_to?(:to_i) && char_count.to_i < 1
        char_count = resolve(char_count)
        rand(36**char_count).to_s(36).rjust(char_count, '0').chars.to_a.shuffle.join
      end

      def sentence(word_count = 4, supplemental = false)
        words(word_count + rand(6), supplemental).join(' ').capitalize + '.'
      end

      def sentences(sentence_count = 3, supplemental = false)
        [].tap do |sentences|
          1.upto(resolve(sentence_count)) do
            sentences << sentence(3, supplemental)
          end
        end
      end

      def paragraph(sentence_count = 3, supplemental = false)
        sentences(resolve(sentence_count) + rand(3), supplemental).join(' ')
      end

      def paragraphs(paragraph_count = 3, supplemental = false)
        [].tap do |paragraphs|
          1.upto(resolve(paragraph_count)) do
            paragraphs << paragraph(3, supplemental)
          end
        end
      end
    end

  private

    # If an array or range is passed, a random value will be selected.
    # All other values are simply returned.
    def self.resolve(value)
      case value
      when Array then value[rand(value.size)]
      when Range then rand((value.last+1) - value.first) + value.first
      else value
      end
    end
  end
end
