module Faker
  class Image < Base
    class << self
      DEFAULT_SIZE = '300x300'

      def image(slug = nil, size = DEFAULT_SIZE)
        raise ArgumentError, "Size must be specified" if size.nil?
        sizes = size.split('x')
        "http://loremflickr.com/#{sizes[0]}/#{sizes[1]}/#{slug}"
      end
    end
  end
end
