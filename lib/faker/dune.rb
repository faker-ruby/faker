module Faker
  class Dune < Base
    class << self
      QUOTED_CHARACTERS = %w(translate("faker.characters"))
      SAYING_SOURCES = %w(translate("faker.sources"))

      def character
        fetch('dune.characters')
      end

      def title
        fetch('dune.titles')
      end

      def planet
        fetch('dune.planets')
      end

      def quote (character = '')
        return bothify(fetch('dune.quotes.' + fetch('dune.quotes'.keys))) if character === ''

        # error check if character not included in dune.yml
        raise ArgumentError, "Characters quoted are #{QUOTED_CHARACTERS.join(', ')}" unless QUOTED_CHARACTERS.include?(character)
        bothify(fetch('dune.quotes.' + character))
      end

      def saying (source = '')
        return bothify(fetch('dune.sayings.' + fetch('dune.sayings'.keys))) if source === ''

        # error check if source not included in dune.yml
        raise ArgumentError, "Sources quoted are #{SAYING_SOURCES.join(', ')}" unless SAYING_SOURCES.include?(source)
        bothify(fetch('dune.sayings.' + source))
      end
    end
  end
end
