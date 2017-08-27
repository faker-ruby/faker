require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerFunnyName < Test::Unit::TestCase

  def setup
    @tester = Faker::FunnyName
  end

  def test_name
    res = @tester.name
    assert res.is_a?(String) && !res.empty?
  end

  def test_two_word_name
    res = @tester.two_word_name
    assert res.count(' ') == 1
  end

  def test_three_word_name
    res = @tester.three_word_name
    assert res.count(' ') == 2
  end

  def test_four_word_name
    res = @tester.four_word_name
    assert res.count(' ') == 3
  end

  def test_name_with_initial
    res = @tester.name_with_initial
    assert res.count('.') > 0
  end
end
