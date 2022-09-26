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

  def test_hsla_color
    @result = @tester.hsla_color
    assert_equal(4, @result.length)

    assert @result[0].between?(0, 360)
    assert @result[1].between?(0.0, 1.0)
    assert @result[2].between?(0.0, 1.0)
    assert @result[3].between?(0.0, 1.0)
  end
end
