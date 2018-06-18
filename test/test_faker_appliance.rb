require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAppliance < Test::Unit::TestCase
  def setup
    @tester = Faker::Appliance
  end

  def test_brand
    assert @tester.brand.match(/\w/)
  end

  def test_equipment
    assert @tester.equipment.match(/\w/)
  end
end
