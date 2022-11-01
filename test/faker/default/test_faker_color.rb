# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerColor < Test::Unit::TestCase
  def setup
    @tester = Faker::Color
  end

  def test_color_name
    assert_match(/[a-z]+\.?/, @tester.color_name)
  end

  def test_hex_color
    assert_match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, @tester.hex_color)
  end

  # @see https://www.rapidtables.com/convert/color/rgb-to-hsl.html
  def helper_hex_lightness(hex_color)
    result = hex_color.scan(/([A-Fa-f0-9]{2})/).flatten.map { |x| x.hex / 255.0 }
    (result.max + result.min) / 2
  end

  def test_hex_color_light
    assert_in_delta(0.8, helper_hex_lightness(@tester.hex_color(:light)))
  end

  def test_hex_color_dark
    assert_in_delta(0.2, helper_hex_lightness(@tester.hex_color(:dark)))
  end

  def test_hex_color_with_hash_is_passed_to_hsl_color
    mock_hsl_color = lambda do |args|
      assert_equal(100, args[:hue])
      assert_in_delta(0.2, args[:saturation])
      assert_in_delta(0.8, args[:lightness])
      [args[:hue], args[:saturation], args[:lightness]]
    end
    @tester.stub :hsl_color, mock_hsl_color do
      result = @tester.hex_color(hue: 100, saturation: 0.2, lightness: 0.8)

      assert_match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, result)
    end
  end

  def test_single_rgb_color
    assert @tester.single_rgb_color.between?(0, 255)
  end

  def test_rgb_color
    @result = @tester.rgb_color

    assert_equal(3, @result.length)

    @result.each do |color|
      assert color.between?(0, 255)
    end
  end

  def test_hsl_color
    @result = @tester.hsl_color

    assert_equal(3, @result.length)

    assert @result[0].between?(0, 360)
    assert @result[0].is_a?(Integer)
    assert @result[1].between?(0.0, 1.0)
    assert @result[2].between?(0.0, 1.0)
  end

  def test_hsl_color_with_a_speficied_hue
    @result = @tester.hsl_color(hue: 5)

    assert_in_delta(5, @result[0])
  end

  def test_hsl_color_with_a_speficied_saturation
    @result = @tester.hsl_color(saturation: 0.35)

    assert_in_delta(0.35, @result[1])
  end

  def test_hsl_color_with_a_speficied_but_invalid_saturation
    @result = @tester.hsl_color(saturation: 3.05)

    assert_in_delta(1, @result[1])
  end

  def test_hsl_color_with_a_speficied_lightness
    @result = @tester.hsl_color(lightness: 0.5)

    assert_in_delta(0.5, @result[2])
  end

  def test_hsl_color_with_a_speficied_but_invalid_lightness
    @result = @tester.hsl_color(lightness: -2.5)

    assert_in_delta(0, @result[2])
  end

  def test_hsla_color
    @result = @tester.hsla_color

    assert_equal(4, @result.length)

    assert @result[0].between?(0, 360)
    assert @result[1].between?(0.0, 1.0)
    assert @result[2].between?(0.0, 1.0)
    assert @result[3].between?(0.0, 1.0)
  end
end
