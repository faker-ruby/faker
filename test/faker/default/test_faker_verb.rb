# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerVerb < Test::Unit::TestCase
  def setup
    @tester = Faker::Verb
  end

  def test_base
    assert_match(/\w+/, @tester.base)
  end

  def test_past
    assert_match(/\w+/, @tester.past)
  end

  def test_past_participle
    assert_match(/\w+/, @tester.past_participle)
  end

  def test_simple_present
    assert_match(/\w+/, @tester.simple_present)
  end

  def test_ing_form
    assert_match(/\w+/, @tester.ing_form)
  end
end
