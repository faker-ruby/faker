# frozen_string_literal: true

module Faker
  class Source < Base
    class << self
      def hello_world(legacy_lang = NOT_GIVEN, lang: :ruby)
        if legacy_lang != NOT_GIVEN
          warn_with_uplevel 'Passing `lang` with the 1st argument of `Source.hello_world` is deprecated. Use keyword argument like `Source.hello_world(lang: ...)` instead.', uplevel: 1
          lang = legacy_lang
        end

        fetch("source.hello_world.#{lang}")
      end

      def print(legacy_str = NOT_GIVEN, legacy_lang = NOT_GIVEN, str: 'some string', lang: :ruby)
        if legacy_str != NOT_GIVEN
          warn_with_uplevel 'Passing `str` with the 1st argument of `Source.print` is deprecated. Use keyword argument like `Source.print(str: ...)` instead.', uplevel: 1
          str = legacy_str
        end
        if legacy_lang != NOT_GIVEN
          warn_with_uplevel 'Passing `lang` with the 2nd argument of `Source.print` is deprecated. Use keyword argument like `Source.print(lang: ...)` instead.', uplevel: 1
          lang = legacy_lang
        end

        code = fetch("source.print.#{lang}")
        code.gsub('faker_string_to_print', str)
      end

      def print_1_to_10(legacy_lang = NOT_GIVEN, lang: :ruby)
        if legacy_lang != NOT_GIVEN
          warn_with_uplevel 'Passing `lang` with the 1st argument of `Source.print_1_to_10` is deprecated. Use keyword argument like `Source.print_1_to_10(lang: ...)` instead.', uplevel: 1
          lang = legacy_lang
        end

        fetch("source.print_1_to_10.#{lang}")
      end
    end
  end
end
