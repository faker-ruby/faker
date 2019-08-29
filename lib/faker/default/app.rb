# frozen_string_literal: true

module Faker
  class App < Base
    class << self
      def name
        fetch('app.name')
      end

      def version
        parse('app.version')
      end

      def author
        parse('app.author')
      end

      # rubocop:disable Metrics/ParameterLists
      def semantic_version(legacy_major = NOT_GIVEN, legacy_minor = NOT_GIVEN, legacy_patch = NOT_GIVEN, major: 0..9, minor: 0..9, patch: 1..9)
        # rubocop:enable Metrics/ParameterLists
        if legacy_major != NOT_GIVEN
          warn_with_uplevel 'Passing `major` with the 1st argument of `App.semantic_version` is deprecated. Use keyword argument like `App.semantic_version(major: ...)` instead.', uplevel: 1
          major = legacy_major
        end
        if legacy_minor != NOT_GIVEN
          warn_with_uplevel 'Passing `minor` with the 2nd argument of `App.semantic_version` is deprecated. Use keyword argument like `App.semantic_version(minor: ...)` instead.', uplevel: 1
          minor = legacy_minor
        end
        if legacy_patch != NOT_GIVEN
          warn_with_uplevel 'Passing `patch` with the 3rd argument of `App.semantic_version` is deprecated. Use keyword argument like `App.semantic_version(patch: ...)` instead.', uplevel: 1
          patch = legacy_patch
        end

        [major, minor, patch].map { |chunk| sample(Array(chunk)) }.join('.')
      end
    end
  end
end
