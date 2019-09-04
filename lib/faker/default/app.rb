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
        warn_for_deprecated_arguments do |keywords|
          keywords << :major if legacy_major != NOT_GIVEN
          keywords << :minor if legacy_minor != NOT_GIVEN
          keywords << :patch if legacy_patch != NOT_GIVEN
        end

        [major, minor, patch].map { |chunk| sample(Array(chunk)) }.join('.')
      end
    end
  end
end
