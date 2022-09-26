# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerScience < Test::Unit::TestCase
  def setup
    @tester = Faker::Science
  end

  def test_science
    assert_match(/\w+/, @tester.science)
    assert_match(/\w+/, @tester.science(:empirical))
    assert_match(/\w+/, @tester.science(:formal))
    assert_match(/\w+/, @tester.science(:natural))
    assert_match(/\w+/, @tester.science(:social))
    assert_match(/\w+/, @tester.science(:basic))
    assert_match(/\w+/, @tester.science(:applied))
    assert_match(/\w+/, @tester.science(:empirical, :natural))
    assert_match(/\w+/, @tester.science(:empirical, :social))
    assert_match(/\w+/, @tester.science(:empirical, :natural, :basic))
    assert_match(/\w+/, @tester.science(:empirical, :natural, :applied))
    assert_match(/\w+/, @tester.science(:empirical, :social, :basic))
    assert_match(/\w+/, @tester.science(:empirical, :social, :applied))
    assert_match(/\w+/, @tester.science(:empirical, :basic))
    assert_match(/\w+/, @tester.science(:empirical, :applied))
    assert_match(/\w+/, @tester.science(:formal, :basic))
    assert_match(/\w+/, @tester.science(:formal, :applied))
  end

  def test_element
    assert_match(/\w+/, @tester.element)
  end

  def test_element_symbol
    assert_match(/\w{1,2}/, @tester.element)
  end

  def test_element_state
    assert_match(/\w+/, @tester.element_state)
  end

  def test_element_subcategory
    assert_match(/\w+/, @tester.element_subcategory)
  end

  def test_scientist
    assert_match(/\w+/, @tester.scientist)
  end

  def test_modifier
    assert_match(/\w+/, @tester.modifier)
  end

  def test_tool
    assert_match(/\w+/, @tester.tool)
  end
end
