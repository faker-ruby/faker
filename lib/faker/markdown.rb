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

      def ordered_list
        number = rand(1..10)

        result = []
        number.times do |i|
          result << "#{i.to_s}. #{Faker::Lorem.sentence(1)} \n"
        end
        result.join(' ')
      end

      def unordered_list
        number = rand(1..10)

        result = []
        number.times do |i|
          result << "* #{Faker::Lorem.sentence(1)} \n"
        end
        result.join('')
      end

      def inline_code
        "`#{Faker::Lorem.sentence(1)}`"
      end

      def block_code
        "```ruby\n#{Faker::Lorem.sentence(1)}\n```"
      end

    end
  end
end
