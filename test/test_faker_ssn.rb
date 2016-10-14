require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerSSN < Test::Unit::TestCase
  def setup
    @tester = Faker::Ssn
  end

  def test_swedish_social_security_number
    ssn = @tester.swedish
    assert_equal 13, ssn.length
    assert ssn.include?("-")
  end

  def test_swedish_ssn_without_hyphen
    ssn = @tester.swedish hyphen: false
    assert_equal 12, ssn.length
    assert !ssn.include?("-")
  end

  def test_swedish_ssn_without_full_year
    ssn = @tester.swedish full_year: false
    assert_equal 11, ssn.length
  end
end
