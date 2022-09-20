# frozen_string_literal: true

module Faker
  class Color < Base
    class << self
      ##
      # Produces a hex color code.
      #
      # @param lightness [Symbol] Allows the client to specify light or dark colors
      #
      # @return [String]
      #
      # @example
      #   Faker::Color.hex_color #=> "#31a785"
      # @example
      #   Faker::Color.hex_color(:light) #=> "#FFEE99"
      # @example
      #   Faker::Color.hex_color(:dark) #=> "#665500"
      #
      # @faker.version next
      def hex_color(lightness = nil)
        lightness_lookup = { light: 0.8, dark: 0.2 }
        hsl_to_hex(hsl_color(lightness: lightness_lookup[lightness]))
      end

      ##
      # Produces the name of a color.
      #
      # @return [String]
      #
      # @example
      #   Faker::Color.color_name #=> "yellow"
      #
      # @faker.version 1.6.2
      def color_name
        fetch('color.name')
      end

      # @private
      def single_rgb_color
        sample((0..255).to_a)
      end

      ##
      # Produces an array of integers representing an RGB color.
      #
      # @return [Array(Integer, Integer, Integer)]
      #
      # @example
      #   Faker::Color.rgb_color #=> [54, 233, 67]
      #
      # @faker.version 1.5.0
      def rgb_color
        Array.new(3) { single_rgb_color }
      end

      ##
      # Produces an array of floats representing an HSL color.
      # The array is in the form of `[hue, saturation, lightness]`.
      #
      # @param lightness [Float] Value to use for lightness
      # @return [Array(Float, Float, Float)]
      #
      # @example
      #   Faker::Color.hsl_color #=> [69.87, 0.66, 0.3]
      # @example
      #   Faker::Color.hsl_color(lightness: 0.6) #=> [69.87, 0.66, 0.6]
      #
      # @faker.version next
      def hsl_color(lightness: nil)
        [sample((0..360).to_a), rand.round(2), lightness || rand.round(2)]
      end

      ##
      # Produces an array of floats representing an HSLA color.
      # The array is in the form of `[hue, saturation, lightness, alpha]`.
      #
      # @return [Array(Float, Float, Float, Float)]
      #
      # @example
      #   Faker::Color.hsla_color #=> [154.77, 0.36, 0.9, 0.2]
      #
      # @faker.version 1.5.0
      def hsla_color
        hsl_color << rand.round(1)
      end

      private

      ##
      # Produces a hex code representation of an HSL color
      #
      # @param a_hsl_color [Array(Float, Float, Float)] The array that represents the HSL color
      #
      # @return [String]
      #
      # @example
      #   hsl_to_hex([50, 100,80]) #=> #FFEE99
      #
      # @see https://en.wikipedia.org/wiki/HSL_and_HSV#HSL_to_RGB
      # @see https://github.com/jpmckinney/color-generator/blob/master/lib/color-generator.rb
      #
      def hsl_to_hex(a_hsl_color)
        h, s, l = a_hsl_color
        c = (1 - (2 * l - 1).abs) * s
        h_prime = h / 60
        x = c * (1 - (h_prime % 2 - 1).abs)
        m = l - 0.5 * c

        rgb = case h_prime.to_i
              when 0 # 0 <= H' < 1
                [c, x, 0]
              when 1 # 1 <= H' < 2
                [x, c, 0]
              when 2 # 2 <= H' < 3
                [0, c, x]
              when 3 # 3 <= H' < 4
                [0, x, c]
              when 4 # 4 <= H' < 5
                [x, 0, c]
              else # 5 <= H' < 6
                [c, 0, x]
              end.map { |value| ((value + m) * 255).round }

        format('#%02x%02x%02x', rgb[0], rgb[1], rgb[2])
      end
    end
  end
end
