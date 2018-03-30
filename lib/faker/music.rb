module Faker
  class Music < Base
    class << self
      def key
        keys.sample + key_variants.sample
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
    end
  end
end
