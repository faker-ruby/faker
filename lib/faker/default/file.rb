# frozen_string_literal: true

module Faker
  class File < Base
    class << self
      def dir(segment_count: 3, root: nil, directory_separator: '/')
        Array
          .new(segment_count) { Faker::Internet.slug }
          .unshift(root)
          .compact
          .join(directory_separator)
          .squeeze(directory_separator)
      end

      def extension
        fetch('file.extension')
      end

      def mime_type
        fetch('file.mime_type')
      end

      def file_name(dir: nil, name: nil, ext: nil, directory_separator: '/')
        dir ||= dir(segment_count: 1)
        name ||= Faker::Lorem.word.downcase
        ext ||= extension

        [dir, name].join(directory_separator) + ".#{ext}"
      end
    end
  end
end
