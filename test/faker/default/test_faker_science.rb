# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerScience < Test::Unit::TestCase
  def setup
    @tester = Faker::Science
  end

  def test_science
    assert_match @tester.science, /\w+/
    assert_match @tester.science(:empirical), /\w+/
    assert_match @tester.science(:formal), /\w+/
    assert_match @tester.science(:natural), /\w+/
    assert_match @tester.science(:social), /\w+/
    assert_match @tester.science(:basic), /\w+/
    assert_match @tester.science(:applied), /\w+/
    assert_match @tester.science(:empirical, :natural), /\w+/
    assert_match @tester.science(:empirical, :social), /\w+/
    assert_match @tester.science(:empirical, :natural, :basic), /\w+/
    assert_match @tester.science(:empirical, :natural, :applied), /\w+/
    assert_match @tester.science(:empirical, :social, :basic), /\w+/
    assert_match @tester.science(:empirical, :social, :applied), /\w+/
    assert_match @tester.science(:empirical, :basic), /\w+/
    assert_match @tester.science(:empirical, :applied), /\w+/
    assert_match @tester.science(:formal, :basic), /\w+/
    assert_match @tester.science(:formal, :applied), /\w+/
  end

  def test_element
    assert_match @tester.element, /\w+/
  end

  def test_element_symbol
    assert_match @tester.element, /\w{1,2}/
  end

  def test_element_state
    assert_match @tester.element_state, /\w+/
  end

  def test_element_subcategory
    assert_match @tester.element_subcategory, /\w+/
  end

  def test_scientist
    assert_match @tester.scientist, /\w+/
  end

  def test_modifier
    assert_match @tester.modifier, /\w+/
  end

  def test_tool
    assert_match @tester.tool, /\w+/
  end
end
