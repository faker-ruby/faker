# frozen_string_literal: true

module Faker
  class File < Base
    class << self
      # rubocop:disable Metrics/ParameterLists
      def dir(legacy_segment_count = NOT_GIVEN, legacy_root = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, segment_count: 3, root: nil, directory_separator: ::File::Separator)
        # rubocop:enable Metrics/ParameterLists
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

      def extension
        fetch('file.extension')
      end

      def mime_type
        fetch('file.mime_type')
      end

      # rubocop:disable Metrics/ParameterLists
      def file_name(legacy_dir = NOT_GIVEN, legacy_name = NOT_GIVEN, legacy_ext = NOT_GIVEN, legacy_directory_separator = NOT_GIVEN, dir: nil, name: nil, ext: nil, directory_separator: ::File::Separator)
        # rubocop:enable Metrics/ParameterLists
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
    end
  end
end
