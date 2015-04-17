module Faker
  class Image < Base
    class << self
      def image_url(category: "abstract", size: "400x200", number: 0)
        raise ArgumentError, "Size should be specified in format 300x300" unless size.match(/^[0-9]+x[0-9]+$/)
        dimensions = size.split("x")
        width = dimensions.first
        height = dimensions.last

        result = "http://lorempixel.com/#{width}/#{height}"

        if category == "random"
          return result
        end

        result += "/#{category}"
        result += "/#{number}" unless number < 1

        return result
      end
    end
  end
end
