module Faker
  class Markdown < Base
    class << self

      def headers
        "#{fetch('markdown.headers')} #{Faker::Lorem.word.capitalize}"
      end

    end
  end
end
