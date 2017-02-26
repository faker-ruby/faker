module Faker
  class Markdown < Base
    class << self

      def headers
        "#{fetch('markdown.headers')} #{Faker::Lorem.word.capitalize}"
      end

      def emphasis
        paragraph = Faker::Lorem.paragraph(3)
        words = paragraph.split(' ')
        position = rand(0..words.length - 1)
        formatting = fetch('markdown.emphasis')
        words[position] = "#{formatting}#{words[position]}#{formatting}"
        words.join(' ')
      end

    end
  end
end
