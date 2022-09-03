# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJob < Test::Unit::TestCase
  def setup
    @tester = Faker::Job
  end

  def test_title
    assert_match @tester.title, /(\w+\.? ?){2,3}/
  end

  def test_field
    assert_match @tester.field, /(\w+\.? ?)/
  end

  def test_key_skill
    assert_match @tester.key_skill, /(\w+\.? ?)/
  end

  def test_position
    assert_match @tester.position, /(\w+\.? ?)/
  end
end
