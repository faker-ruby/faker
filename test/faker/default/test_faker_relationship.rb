# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRelationship < Test::Unit::TestCase
  def setup
    @tester = Faker::Relationship
  end

  def test_random_familial
    assert @tester.familial.match?(/\w+/)
  end

  def test_familial_direct
    assert @tester.familial(connection: 'direct').match?(/\w+/)
  end

  def test_familial_extended
    assert @tester.familial(connection: 'extended').match?(/\w+/)
  end

  # test error on no match
  def test_invalid_familial_connection
    assert_raise ArgumentError do
      @tester.familial(connection: 'Not Correct')
    end
  end

  def test_in_law
    assert @tester.in_law.match?(/\w+/)
  end

  def test_spouse
    assert @tester.spouse.match?(/\w+/)
  end

  def test_parent
    assert @tester.parent.match?(/\w+/)
  end

  def test_sibling
    assert @tester.sibling.match?(/\w+/)
  end
end
