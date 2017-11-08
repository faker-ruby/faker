require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerWrestling < Test::Unit::TestCase
  def setup
    @tester = Faker::Wrestling
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_move
    assert @tester.move.match(/\w+/)
  end


end
