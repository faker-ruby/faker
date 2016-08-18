module Faker
  class Fillmurray < Base
    class << self

      def image(width = '200', height= '200', grayscale = false)
        raise ArgumentError, "Width should be a number in string format" unless width.match(/^[0-9]+$/)
        raise ArgumentError, "Height should be a number in string format" unless height.match(/^[0-9]+$/)
        raise ArgumentError "Grayscale should be turned on or off through a boolean" if grayscale != true || grayscale != false

        fillmurray_url = "http://fillmurray.org/#{width}/#{height}"
        fillmurray_url = "http://fillmurray.org/g/#{width}/#{height}" if grayscale
        fillmurray_url 
      end
    end
  end
end