module Faker
  class App < Base
    class << self

      def name
        fetch('app.name')
      end

      def version
        if parse('app.version') == ''
          numerify(fetch('app.version'))
        else
          parse('app.version')
        end
      end

      def author
        parse('app.author')
      end
    end
  end
end
