require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerChar < Test::Unit::TestCase
  def setup
    @tester = Faker::Char
  end

  def test_fix_umlauts
    assert @tester.fix_umlauts('ä') == 'ae'
    assert @tester.fix_umlauts('ö') == 'oe'
    assert @tester.fix_umlauts('ü') == 'ue'
    assert @tester.fix_umlauts('ß') == 'ss'
  end
end
