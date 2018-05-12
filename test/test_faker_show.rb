require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerShow < Test::Unit::TestCase
  def test_musical
    assert Faker::Show.musical.match(/\w+/)
  end
  def test_kids_musical
    assert Faker::Show.kids_musical.match(/\w+/)
  end
  def test_play
    assert Faker::Show.play.match(/\w+/)
  end
end
