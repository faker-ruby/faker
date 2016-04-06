module Faker
  class Image < Base
    DEFAULT_SIZE = '300x300'

    def self.image(slug = nil, size = DEFAULT_SIZE)
      raise ArgumentError, "Size should be specified in format #{ DEFAULT_SIZE }" unless size.match(/^[0-9]+x[0-9]+$/)
      sizes = size.split('x')
      "http://loremflickr.com/#{sizes[0]}/#{sizes[1]}/#{slug}"
    end
  end
end
