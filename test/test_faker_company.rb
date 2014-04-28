require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCompany < Test::Unit::TestCase
  def setup
    @tester = Faker::Company
  end

  def test_company_name
    for _ in 1..100
      assert @tester.name.match(/(\w+\.? ?){2,3}/)
    end
  end

  def test_company_name_with_max_length
    max_length = 32
    for _ in 1..100
      assert @tester.name(max_length: max_length).length <= max_length
    end
  end

  def test_company_name_with_unachievable_criteria
    max_tries = 5
    x = nil
    begin 
      @tester.name(max_length: 0, max_tries: max_tries)
    rescue RuntimeError => e
      x = e
    end
    assert x.message == "Unable to match criteria within try limit (#{max_tries})"
  end

  def test_duns_number
    assert @tester.duns_number.match(/\d\d-\d\d\d-\d\d\d\d/)
  end
end
