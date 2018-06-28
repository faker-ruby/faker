require_relative 'test_helper'

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
