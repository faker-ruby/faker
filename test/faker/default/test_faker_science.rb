# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerScience < Test::Unit::TestCase
  def setup
    @tester = Faker::Science
  end

  def test_element
    assert @tester.element.match(/\w+/)
  end

  def test_element_symbol
    assert @tester.element.match(/\w{1,2}/)
  end

  def test_scientist
    assert @tester.scientist.match(/\w+/)
  end
end
