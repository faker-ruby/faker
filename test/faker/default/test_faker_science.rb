# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerScience < Test::Unit::TestCase
  def setup
    @tester = Faker::Science
  end

  def test_science
    assert @tester.science.match(/\w+/)
    assert @tester.science(:empirical).match(/\w+/)
    assert @tester.science(:formal).match(/\w+/)
    assert @tester.science(:natural).match(/\w+/)
    assert @tester.science(:social).match(/\w+/)
    assert @tester.science(:basic).match(/\w+/)
    assert @tester.science(:applied).match(/\w+/)
    assert @tester.science(:empirical, :natural).match(/\w+/)
    assert @tester.science(:empirical, :social).match(/\w+/)
    assert @tester.science(:empirical, :natural, :basic).match(/\w+/)
    assert @tester.science(:empirical, :natural, :applied).match(/\w+/)
    assert @tester.science(:empirical, :social, :basic).match(/\w+/)
    assert @tester.science(:empirical, :social, :applied).match(/\w+/)
    assert @tester.science(:empirical, :basic).match(/\w+/)
    assert @tester.science(:empirical, :applied).match(/\w+/)
    assert @tester.science(:formal, :basic).match(/\w+/)
    assert @tester.science(:formal, :applied).match(/\w+/)
  end

  def test_element
    assert @tester.element.match(/\w+/)
  end

  def test_element_symbol
    assert @tester.element.match(/\w{1,2}/)
  end

  def test_element_state
    assert @tester.element_state.match(/\w+/)
  end

  def test_element_subcategory
    assert @tester.element_subcategory.match(/\w+/)
  end

  def test_scientist
    assert @tester.scientist.match(/\w+/)
  end

  def test_modifier
    assert @tester.modifier.match(/\w+/)
  end

  def test_tool
    assert @tester.tool.match(/\w+/)
  end
end
