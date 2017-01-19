require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNHS < Test::Unit::TestCase
  def setup
    @tester = Faker::NHS
  end

  def test_nhs_number_format
    assert_match(/\A\d{3}\s\d{3}\s\d{4}\z/, @tester.nhs_number)
  end

  def test_nhs_check_digit
    assert_equal 6, @tester.check_digit(400_012_114)
  end
end
