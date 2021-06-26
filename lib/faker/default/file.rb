# frozen_string_literal: true

module Faker
  class File < Base
    class << self
      # rubocop:disable Metrics/ParameterLists

      ##
      # Produces a random directory name.
      #
      # @param segment_count [Integer] Specifies the number of nested folders in the generated string.
      # @param root [String] Specifies the root of the generated string.
      # @param directory_separator [String] Specifies the separator between the segments.
      # @return [String]
      #
      # @example
      #   Faker::File.dir #=> "et_error/sint_voluptas/quas_veritatis"
      #   Faker::File.dir(segment_count: 2) #=> "ea-suscipit/ut-deleniti"
      #   Faker::File.dir(segment_count: 3, root: nil, directory_separator: '/') #=> "est_porro/fugit_eveniet/incidunt-autem"
      #   Faker::File.dir(segment_count: 3, root: nil, directory_separator: '\\') #=> "aut-ullam\\quia_quisquam\\ut-eos"
      #
      # @faker.version 1.6.4
      def dir(legacy_segment_count = NOT_GIVEN, legacy_root = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, segment_count: 3, root: nil, directory_separator: ::File::Separator)
        warn_for_deprecated_arguments do |keywords|
          keywords << :segment_count if legacy_segment_count != NOT_GIVEN
          keywords << :root if legacy_root != NOT_GIVEN
          keywords << :directory_separator if legacy_directory_separator != NOT_GIVEN
        end

        Array
          .new(segment_count) { Faker::Internet.slug }
          .unshift(root)
          .compact
          .join(directory_separator)
          .squeeze(directory_separator)
      end
      # rubocop:enable Metrics/ParameterLists

      ##
      # Produces a random file extension.
      #
      # @return [String]
      #
      # @example
      #   Faker::File.extension #=> "mp3"
      #
      # @faker.version 1.6.4
      def extension
        fetch('file.extension')
      end

      ##
      # Produces a random mime type.
      #
      # @return [String]
      #
      # @example
      #   Faker::File.mime_type #=> "application/pdf"
      #
      # @faker.version 1.6.4
      def mime_type
        fetch('file.mime_type')
      end

      # rubocop:disable Metrics/ParameterLists

      ##
      # Produces a random file name.
      #
      # @param dir [String] Specifies the path used for the generated file.
      # @param name [String] Specifies the filename used for the generated file.
      # @param ext [String] Specifies the extension used the generated file.
      # @param directory_separator [String] Specifies the separator between the directory and name elements.
      # @return [String]
      #
      # @example
      #   Faker::File.file_name(dir: 'path/to') #=> "path/to/something_random.jpg"
      #   Faker::File.file_name(dir: 'foo/bar', name: 'baz') #=> "foo/bar/baz.zip"
      #   Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'doc') #=> "foo/bar/baz.doc"
      #   Faker::File.file_name(dir: 'foo/bar', name: 'baz', ext: 'mp3', directory_separator: '\\') #=> "foo/bar\\baz.mp3"
      #
      # @faker.version 1.6.4
      def file_name(legacy_dir = NOT_GIVEN, legacy_name = NOT_GIVEN, legacy_ext = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, dir: nil, name: nil, ext: nil, directory_separator: ::File::Separator)
        warn_for_deprecated_arguments do |keywords|
          keywords << :dir if legacy_dir != NOT_GIVEN
          keywords << :name if legacy_name != NOT_GIVEN
          keywords << :ext if legacy_ext != NOT_GIVEN
          keywords << :directory_separator if legacy_directory_separator != NOT_GIVEN
        end

        dir ||= dir(segment_count: 1)
        name ||= Faker::Lorem.word.downcase
        ext ||= extension

        [dir, name].join(directory_separator) + ".#{ext}"
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end
end
