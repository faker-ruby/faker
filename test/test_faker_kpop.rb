require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerKpop < Test::Unit::TestCase
  def setup
    @tester = Faker::Kpop
  end

  def test_i_groups
    assert @tester.i_groups.match(/\w+/)
  end

  def test_ii_groups
    assert @tester.ii_groups.match(/\w+/)
  end

  def test_iii_groups
    assert @tester.iii_groups.match(/\w+/)
  end

  def test_girl_groups
    assert @tester.girl_groups.match(/\w+/)
  end

  def test_boy_bands
    assert @tester.boy_bands.match(/\w+/)
  end

  def test_solo
    assert @tester.solo.match(/\w+/)
  end
end
