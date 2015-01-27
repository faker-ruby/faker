require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerColor < Test::Unit::TestCase
  def setup
    @tester = Faker::Color
  end

  def test_hex_color
    assert @tester.hex_color.match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/)
  end
end
