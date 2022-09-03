# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVerb < Test::Unit::TestCase
  def setup
    @tester = Faker::Verb
  end

  def test_base
    assert_match @tester.base, /\w+/
  end

  def test_past
    assert_match @tester.past, /\w+/
  end

  def test_past_participle
    assert_match @tester.past_participle, /\w+/
  end

  def test_simple_present
    assert_match @tester.simple_present, /\w+/
  end

  def test_ing_form
    assert_match @tester.ing_form, /\w+/
  end
end
