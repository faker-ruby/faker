module Faker
  class Color < Base
    class << self
      def hex_color
        @hex_color = "#%06x" % (rand * 0xffffff)
      end

      def single_rgb_color
        @single_rgb_color = rand(0..255)
      end

      def rgb_color
        @rgb_colors = []
        3.times do
          @rgb_colors.push single_rgb_color
        end
        @rgb_colors
      end

      def single_hsl_color
        @single_hsla_color = rand(0.00..360.00).round(2)
      end

      def hsl_color
        @hsl_colors = []
        3.times do
          @hsl_colors.push single_hsl_color
        end
        @hsl_colors
      end
    end
  end
end
