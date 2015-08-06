module Faker
  class Book < Base
    flexible :book

    class << self
      def title
        fetch('book.title')
      end

      def author
        parse('book.author')
      end

      def publisher
        fetch('book.publisher')
      end
    end
  end
end
