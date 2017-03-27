module Faker
  class App < Base
    class << self

      def name
        fetch('app.name')
      end

      def version
        parse('app.version')
      end

      def author
        parse('app.author')
      end
    end
  end
end
