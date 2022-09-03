# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerUniversity < Test::Unit::TestCase
  def setup
    @tester = Faker::University
    @alphabet = Faker::University.greek_alphabet
  end

  def test_prefix
    assert_match @tester.prefix, /\w+\.?/
  end

  def test_suffix
    assert_match @tester.suffix, /\w+\.?/
  end

  def test_name
    assert_match @tester.name, /\w+\.?/
  end

  def test_greek_alphabet_has_24_characters
    assert_equal(24, @alphabet.count)
  end

  def test_greek_organization
    assert_match @tester.greek_organization, /\p{Greek}|\w+/
    assert_equal(3, @tester.greek_organization.length)
  end

  def test_greek_organization_is_assembled_from_greek_alphabet
    test_organization = @tester.greek_organization
    test_organization.each_char do |letter|
      assert_includes @alphabet, letter
    end
  end
end
