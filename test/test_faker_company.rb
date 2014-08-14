require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCompany < Test::Unit::TestCase
  def setup
    @tester = Faker::Company
  end

  def test_ein
    assert @tester.ein.match(/\d\d-\d\d\d\d\d\d\d/)
  end

  def test_duns_number
    assert @tester.duns_number.match(/\d\d-\d\d\d-\d\d\d\d/)
  end

  def test_logo
	  assert @tester.logo.match(%r{http://www.biz-logo.com/examples/\d+\.gif})
  end
end
