# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerIndustrySegments < Test::Unit::TestCase
  def setup
    @tester = Faker::IndustrySegments
  end

  def test_industry
    assert @tester.industry.match(/(\w+\.? ?){2,3}/)
  end

  def test_super_sector
    assert @tester.super_sector.match(/(\w+\.? ?){2,3}/)
  end

  def test_sector
    assert @tester.sector.match(/(\w+\.? ?){2,3}/)
  end

  def test_sub_sector
    assert @tester.sub_sector.match(/(\w+\.? ?){2,3}/)
  end
end
