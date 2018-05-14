module Faker
  class Markdown < Base
    class << self

      def headers
        "#{fetch('markdown.headers')} #{Lorem.word.capitalize}"
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
        result.join('')
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
        "```ruby\n#{Lorem.sentence(1)}\n```"
      end

      def table
        table = []
        3.times do
          table << "#{Lorem.word} | #{Lorem.word} | #{Lorem.word}"
        end
        table.insert(1, '---- | ---- | ----')
        table.join("\n")
      end

      def random
        send(available_methods[rand(0..available_methods.length - 1)])
      end

      private

      def available_methods
        Markdown.public_methods(false) - Base.methods
      end

    end
  end
end
