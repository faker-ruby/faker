require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCompany < Test::Unit::TestCase
  
  def setup
    @tester = Faker::Company
  end
  def test_tax_id_number
    assert @tester.tax_id_number.match(/^\d{2}-\d{7}$/)
    assert @tester.ein.match(/^\d{2}-\d{7}$/), "tax_id_number alias 'ein' does not match"
    assert @tester.tin.match(/^\d{2}-\d{7}$/), "tax_id_number alias 'tin' does not match"
  end
  
end
