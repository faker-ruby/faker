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

      def single_hsl_color
        hsl_hue
      end

      def alpha_channel
        rand.round(2)
      end

      def hsl_color
        hsl_colors = []
        hsl_colors << hsl_hue
        2.times { hsl_colors << rand.round(2) }
        hsl_colors
      end

      def hsla_color
        @hsla_colors = []
        3.times do
          @hsla_colors.push single_hsl_color
        end
        @hsla_colors.push alpha_channel
        @hsla_colors
      end

      private

      def hsl_hue
        Faker::Base::rand_in_range(0, 360)
      end

    end
  end
end
