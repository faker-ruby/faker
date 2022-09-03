# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRelationship < Test::Unit::TestCase
  def setup
    @tester = Faker::Relationship
  end

  def test_random_familial
    assert_match @tester.familial, /\w+/
  end

  def test_familial_direct
    assert_match @tester.familial(connection: 'direct'), /\w+/
  end

  def test_familial_extended
    assert_match @tester.familial(connection: 'extended'), /\w+/
  end

  # test error on no match
  def test_invalid_familial_connection
    assert_raise ArgumentError do
      @tester.familial(connection: 'Not Correct')
    end
  end

  def test_in_law
    assert_match @tester.in_law, /\w+/
  end

  def test_spouse
    assert_match @tester.spouse, /\w+/
  end

  def test_parent
    assert_match @tester.parent, /\w+/
  end

  def test_sibling
    assert_match @tester.sibling, /\w+/
  end
end
