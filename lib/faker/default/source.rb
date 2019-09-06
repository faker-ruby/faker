# frozen_string_literal: true

module Faker
  class Source < Base
    class << self
      def hello_world(legacy_lang = NOT_GIVEN, lang: :ruby)
        warn_for_deprecated_arguments do |keywords|
          keywords << :lang if legacy_lang != NOT_GIVEN
        end

        fetch("source.hello_world.#{lang}")
      end

      def print(legacy_str = NOT_GIVEN, legacy_lang = NOT_GIVEN, str: 'some string', lang: :ruby)
        warn_for_deprecated_arguments do |keywords|
          keywords << :str if legacy_str != NOT_GIVEN
        end
        warn_for_deprecated_arguments do |keywords|
          keywords << :lang if legacy_lang != NOT_GIVEN
        end

        code = fetch("source.print.#{lang}")
        code.gsub('faker_string_to_print', str)
      end

      def print_1_to_10(legacy_lang = NOT_GIVEN, lang: :ruby)
        warn_for_deprecated_arguments do |keywords|
          keywords << :lang if legacy_lang != NOT_GIVEN
        end

        fetch("source.print_1_to_10.#{lang}")
      end
    end
  end
end
