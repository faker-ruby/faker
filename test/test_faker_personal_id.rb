require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerPersonalId < Test::Unit::TestCase

  def setup
    @tester = Faker::PersonalId
  end

  def test_ssn #Social Security Number; United States - allows 987-65-4320 - 987-65-4329 for advertising thus is safe for fake data
    assert @tester.ssn.match(/\d\d\d-00-\d\d\d\d/) #987-65-432
  end

  def test_nino #National Insurance number; UK Based on this: http://www.hmrc.gov.uk/manuals/nimmanual/NIM39110.htm QQ should be a valid range
    assert @tester.nino.match(/QQ\d\d\d\d\d\d[A-D]/)
  end

  def test_sin #Social Insurance Number; Canada; zero (0) is reserved as a leading digit for sample numbers
    assert @tester.sin.match(/0\d\d-\d\d\d-\d\d\d/)
  end

end