# frozen_string_literal: true

module Faker
  class Fillmurray < Base
    class << self
      ##
      # Produces the URL of an image from Fill Murray, a site which hosts
      # exclusively photographs of actor Bill Murray.
      #
      # @param grayscale [Boolean] Whether to return a grayscale image.
      # @param width [Integer] The iamage width.
      # @param height [Integer] The image height.
      # @return [String]
      #
      # @example
      #   Faker::Fillmurray.image #=> "https://www.fillmurray.com/300/300"
      #
      # @example
      #   Faker::Fillmurray.image(grayscale: true)
      #     #=> "https://fillmurray.com/g/300/300"
      #
      # @example
      #   Faker::Fillmurray.image(grayscale: false, width: 200, height: 400)
      #     #=> "https://fillmurray.com/200/400"
      #
      # @faker.version 1.7.1
      def image(grayscale: false, width: 200, height: 200)
        raise ArgumentError, 'Width should be a number' unless width.to_s =~ /^\d+$/
        raise ArgumentError, 'Height should be a number' unless height.to_s =~ /^\d+$/
        raise ArgumentError, 'Grayscale should be a boolean' unless [true, false].include?(grayscale)

        "https://www.fillmurray.com#{'/g' if grayscale == true}/#{width}/#{height}"
      end
    end
  end
end
