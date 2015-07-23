require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerColor < Test::Unit::TestCase
  def setup
    @tester = Faker::Color
  end

  def test_hex_color
    assert @tester.hex_color.match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/)
  end

  def test_single_rgb_color
    assert @tester.single_rgb_color.between?(0, 255)
  end

  def test_rgb_color
    @result = @tester.rgb_color
    assert @result.length == 3

    @result.each do |color|
      assert color.between?(0, 255)
    end
  end

  def test_single_hsl_color
    assert @tester.single_hsl_color.between?(0.0, 360.0)
  end

  def test_hsl_color
    @result = @tester.hsl_color
    assert @result.length == 3

    @result.each do |color|
      assert color.between?(0.0, 360.0)
    end
  end

  def test_hsla_color
    @result = @tester.hsla_color
    assert @result.length == 4

    @result.each do |color|
      assert color.between?(0.0, 360.0) || color.between?(0.0, 1.0)
    end
  end
end
