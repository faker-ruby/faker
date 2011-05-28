module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    def self.words(num = 3, supplemental = false)
      wordlist = I18n.translate('faker.lorem.words')
      wordlist += I18n.translate('faker.lorem.supplemental') if supplemental
      wordlist.shuffle[0, num]
    end

    def self.sentence(word_count = 4, supplemental = false)
      words(word_count + rand(6), supplemental).join(' ').capitalize + '.'
    end

    def self.sentences(sentence_count = 3, supplemental = false)
      [].tap do |sentences|
        1.upto(sentence_count) do
          sentences << sentence(3, supplemental)
        end
      end
    end

    def self.paragraph(sentence_count = 3, supplemental = false)
      sentences(sentence_count + rand(3), supplemental).join(' ')
    end

    def self.paragraphs(paragraph_count = 3, supplemental = false)
      [].tap do |paragraphs|
        1.upto(paragraph_count) do
          paragraphs << paragraph(3, supplemental)
        end
      end
    end
  end
end
