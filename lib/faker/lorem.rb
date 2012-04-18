module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    def self.words(num = 3, supplemental = false)
      (
        translate('faker.lorem.words') + 
        (supplemental ? translate('faker.lorem.supplemental') : [])
      ).shuffle[0, resolve(num)]
    end
    
    def self.characters(char_count = 255)
      rand(36**resolve(char_count)).to_s(36)
    end

    def self.sentence(word_count = 4, supplemental = false)
      words(word_count + rand(6), supplemental).join(' ').capitalize + '.'
    end

    def self.sentences(sentence_count = 3, supplemental = false)
      [].tap do |sentences|
        1.upto(resolve(sentence_count)) do
          sentences << sentence(3, supplemental)
        end
      end
    end

    def self.paragraph(sentence_count = 3, supplemental = false)
      sentences(sentence_count + rand(3), supplemental).join(' ')
    end

    def self.paragraphs(paragraph_count = 3, supplemental = false)
      [].tap do |paragraphs|
        1.upto(resolve(paragraph_count)) do
          paragraphs << paragraph(3, supplemental)
        end
      end
    end

  private
    # If an array or range is passed, a random value will be selected.
    # All other values are simply returned.
    def self.resolve(value)
      case value
      when Array then value[rand(value.size)]
      when Range then pick_number(value)
      else value
      end
    end
    def self.pick_number(range)
      rand((range.last+1) - range.first) + range.first
    end
  end
end
