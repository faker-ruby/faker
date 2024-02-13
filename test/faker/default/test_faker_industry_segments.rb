# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerIndustrySegments < Test::Unit::TestCase
  def setup
    @tester = Faker::IndustrySegments
  end

  def test_industry
    assert_match(/(\w+\.? ?){2,3}/, @tester.industry)
  end

  def test_super_sector
    assert_match(/(\w+\.? ?){2,3}/, @tester.super_sector)
  end

  def test_sector
    assert_match(/(\w+\.? ?){2,3}/, @tester.sector)
  end

  def test_sub_sector
    assert_match(/(\w+\.? ?){2,3}/, @tester.sub_sector)
  end
end
