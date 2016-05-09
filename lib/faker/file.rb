# encoding: utf-8
module Faker
  class File < Base
    class << self
      def extension()
        fetch("file.extension")
      end
      def mime_type()
        fetch('file.mime_type')
      end
      def fileName(dir=nil, name=nil, ext = nil, directory_separator = '/')

        dir = Faker::Internet::slug unless dir
        name = Faker::Lorem::word().downcase unless name
        ext = extension unless ext

        fileName = [dir, name].join(directory_separator)
        fileName += ".#{ext}"
      end
    end
  end
end
