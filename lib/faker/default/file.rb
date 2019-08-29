# frozen_string_literal: true

module Faker
  class File < Base
    class << self
      # rubocop:disable Metrics/ParameterLists
      def dir(legacy_segment_count = NOT_GIVEN, legacy_root = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, segment_count: 3, root: nil, directory_separator: '/')
        # rubocop:enable Metrics/ParameterLists
        if legacy_segment_count != NOT_GIVEN
          warn_with_uplevel 'Passing `segment_count` with the 1st argument of `File.dir` is deprecated. Use keyword argument like `File.dir(segment_count: ...)` instead.', uplevel: 1
          segment_count = legacy_segment_count
        end
        if legacy_root != NOT_GIVEN
          warn_with_uplevel 'Passing `root` with the 2nd argument of `File.dir` is deprecated. Use keyword argument like `File.dir(root: ...)` instead.', uplevel: 1
          root = legacy_root
        end
        if legacy_directory_separator != NOT_GIVEN
          warn_with_uplevel 'Passing `directory_separator` with the 3rd argument of `File.dir` is deprecated. Use keyword argument like `File.dir(directory_separator: ...)` instead.', uplevel: 1
          directory_separator = legacy_directory_separator
        end

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

      # rubocop:disable Metrics/ParameterLists
      def file_name(legacy_dir = NOT_GIVEN, legacy_name = NOT_GIVEN, legacy_ext = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, dir: nil, name: nil, ext: nil, directory_separator: '/')
        # rubocop:enable Metrics/ParameterLists
        if legacy_dir != NOT_GIVEN
          warn_with_uplevel 'Passing `dir` with the 1st argument of `File.file_name` is deprecated. Use keyword argument like `File.file_name(dir: ...)` instead.', uplevel: 1
          dir = legacy_dir
        end
        if legacy_name != NOT_GIVEN
          warn_with_uplevel 'Passing `name` with the 2nd argument of `File.file_name` is deprecated. Use keyword argument like `File.file_name(name: ...)` instead.', uplevel: 1
          name = legacy_name
        end
        if legacy_ext != NOT_GIVEN
          warn_with_uplevel 'Passing `ext` with the 3rd argument of `File.file_name` is deprecated. Use keyword argument like `File.file_name(ext: ...)` instead.', uplevel: 1
          ext = legacy_ext
        end
        if legacy_directory_separator != NOT_GIVEN
          warn_with_uplevel 'Passing `directory_separator` with the 4th argument of `File.file_name` is deprecated. Use keyword argument like `File.file_name(directory_separator: ...)` instead.', uplevel: 1
          directory_separator = legacy_directory_separator
        end

        dir ||= dir(segment_count: 1)
        name ||= Faker::Lorem.word.downcase
        ext ||= extension

        [dir, name].join(directory_separator) + ".#{ext}"
      end
    end
  end
end
