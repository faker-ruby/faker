# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRelationship < Test::Unit::TestCase
  def setup
    @tester = Faker::Relationship
  end

  def test_random_familial
    assert_match(/\w+/, @tester.familial)
  end

  def test_familial_direct
    assert_match(/\w+/, @tester.familial(connection: 'direct'))
  end

  def test_familial_extended
    assert_match(/\w+/, @tester.familial(connection: 'extended'))
  end

  # test error on no match
  def test_invalid_familial_connection
    assert_raise ArgumentError do
      @tester.familial(connection: 'Not Correct')
    end
  end

  def test_in_law
    assert_match(/\w+/, @tester.in_law)
  end

  def test_spouse
    assert_match(/\w+/, @tester.spouse)
  end

  def test_parent
    assert_match(/\w+/, @tester.parent)
  end

  def test_sibling
    assert_match(/\w+/, @tester.sibling)
  end
end
