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
    assert @tester.logo.match(%r{https://pigment.github.io/fake-logos/logos/medium/color/\d+\.png})
  end

  def test_buzzword
    assert @tester.buzzword.match(/\w+\.?/)
  end

  def test_swedish_organisation_number
    org_no = @tester.swedish_organisation_number
    assert org_no.match(/\d{10}/)
    assert org_no[9] == @tester.send(:luhn_algorithm, org_no[0..8]).to_s
  end

  def test_profession
    assert @tester.profession.match(/[a-z ]+\.?/)
  end

end
