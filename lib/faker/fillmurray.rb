module Faker
  class Fillmurray < Base
    class << self

      def image(grayscale = false, width = 200, height = 200)
        raise ArgumentError, "Width should be a number" unless width.match(/^\d+$/)
        raise ArgumentError, "Height should be a number" unless height.match(/^\d+$/)
        raise ArgumentError, "Grayscale should be a boolean" unless [true, false].include?(grayscale)

        grayscale == true ? "https://fillmurray.com/g/#{width}/#{height}" : "https://fillmurray.com/#{width}/#{height}"
      end
    end
  end
end
