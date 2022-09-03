# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerIndustrySegments < Test::Unit::TestCase
  def setup
    @tester = Faker::IndustrySegments
  end

  def test_industry
    assert_match @tester.industry, /(\w+\.? ?){2,3}/
  end

  def test_super_sector
    assert_match @tester.super_sector, /(\w+\.? ?){2,3}/
  end

  def test_sector
    assert_match @tester.sector, /(\w+\.? ?){2,3}/
  end

  def test_sub_sector
    assert_match @tester.sub_sector, /(\w+\.? ?){2,3}/
  end
end
