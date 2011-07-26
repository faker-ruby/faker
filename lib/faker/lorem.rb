module Faker
  # Based on Perl's Text::Lorem
  class Lorem < Base
    def self.words(num = 3)
      candidates = begin
        I18n.translate('faker.lorem.words', :throw => true)
      rescue
        I18n.translate('faker.lorem.words', :locale => :en)
      end
      candidates.shuffle[0, num]
    end

    def self.sentence(word_count = 4)
      words(word_count + rand(6)).join(' ').capitalize + '.'
    end

    def self.sentences(sentence_count = 3)
      [].tap do |sentences|
        1.upto(sentence_count) do
          sentences << sentence
        end
      end
    end

    def self.paragraph(sentence_count = 3)
      sentences(sentence_count + rand(3)).join(' ')
    end

    def self.paragraphs(paragraph_count = 3)
      [].tap do |paragraphs|
        1.upto(paragraph_count) do
          paragraphs << paragraph
        end
      end
    end
  end
end
