module Faker
  class Book < Base
    flexible :book

    class << self
      def title
        fetch('book.title')
      end

      def author
        fetch('book.author')
      end

      def publisher
        fetch('book.publisher')
      end

      def genre
        fetch('book.genre')
      end

      def summary
        "#{fetch('book.summary_item')} #{fetch('book.meets')} #{fetch('book.summary_item')}"
      end
    end
  end
end
