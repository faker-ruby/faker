module Faker
  class Color < Base
    class << self
      def hex_color
        @hex_color = '#%06x' % (rand * 0xffffff)
      end

      def color_name
        fetch('color.name')
      end

      def single_rgb_color
        @single_rgb_color = (0..255).to_a.sample
        @single_rgb_color
      end

      def rgb_color
        @rgb_colors = []
        3.times do
          @rgb_colors.push single_rgb_color
        end
        @rgb_colors
      end

      def hsl_color
        hsl_values = []
        hsl_values << (0..360).to_a.sample
        2.times { hsl_values << rand.round(2) }
        hsl_values
      end

      def hsla_color
        hsla_values = hsl_color
        hsla_values << rand.round(1)
        hsla_values
      end
    end
  end
end
