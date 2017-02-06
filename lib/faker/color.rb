module Faker
  class Color < Base
    class << self
      def hex_color
        '#%06x' % (Faker::Config.random.rand * 0xffffff)
      end

      def color_name
        fetch('color.name')
      end

      def single_rgb_color
        (0..255).to_a.sample(random: Faker::Config.random)
      end

      def rgb_color
        3.times.collect { single_rgb_color }
      end

      # returns [hue, saturation, lightness]
      def hsl_color
        [(0..360).to_a.sample(random: Faker::Config.random), Faker::Config.random.rand.round(2), Faker::Config.random.rand.round(2)]
      end

      def hsla_color
        hsl_color << Faker::Config.random.rand.round(1)
      end
    end
  end
end
