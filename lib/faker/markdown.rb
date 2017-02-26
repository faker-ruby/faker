module Faker
  class Markdown < Base
    class << self

      def headers
        fetch('markdown.headers')
      end

    end
  end
end
