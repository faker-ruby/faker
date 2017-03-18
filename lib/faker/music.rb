module Faker
  class Music < Base
    class << self
      def key
        sample(keys) + sample(key_variants)
      end

      def chord
        key + sample(chord_types)
      end

      def instrument
        fetch('music.instruments')
      end

      def keys
        ['C', 'D', 'E', 'F', 'G', 'A', 'B']
      end

      def key_variants
        ['b', '#', '']
      end

      def key_types
        ['', 'm']
      end

      def chord_types
        ['', 'maj', '6', 'maj7', 'm', 'm7', '-7', '7', 'dom7', 'dim', 'dim7', 'm7b5']
      end
    end
  end
end
