# encoding: utf-8
module Faker
  class File < Base
    class << self
      def extension
        fetch('file.extension')
      end

      def mime_type
        fetch('file.mime_type')
      end

      def file_name(dir = nil, name = nil, ext = nil, directory_separator = '/')

        dir = Faker::Internet::slug unless dir
        name = Faker::Lorem::word().downcase unless name
        ext = extension unless ext

        file_name = [dir, name].join(directory_separator)
        file_name += '.#{ext}'
      end
    end
  end
end
