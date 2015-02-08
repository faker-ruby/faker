require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerColor < Test::Unit::TestCase
  def setup
    @color = Faker::Color
  end

  def test_hex
    assert @color.hex.match(/#[a-f0-9]{6}/)
  end
end
