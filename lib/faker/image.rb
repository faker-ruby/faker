module Faker
  class Image < Base
    class << self
      def image(slug = nil, size = '300x300')
        raise ArgumentError, "Size must be specified" if size.nil?
        raise ArgumentError, "Size should be specified in format 300x300" unless size.match(/^[0-9]+x[0-9]+$/)
        sizes = size.split('x')
        "http://loremflickr.com/#{sizes[0]}/#{sizes[1]}/#{slug}"
      end
    end
  end
end
