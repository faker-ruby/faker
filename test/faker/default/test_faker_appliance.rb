# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAppliance < Test::Unit::TestCase
  def setup
    @tester = Faker::Appliance
  end

  def test_brand
    assert_match(/\w/, @tester.brand)
  end

  def test_equipment
    assert_match(/\w/, @tester.equipment)
  end
end
