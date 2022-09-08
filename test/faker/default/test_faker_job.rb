# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJob < Test::Unit::TestCase
  def setup
    @tester = Faker::Job
  end

  def test_title
    assert_match(/(\w+\.? ?){2,3}/, @tester.title)
  end

  def test_field
    assert_match(/(\w+\.? ?)/, @tester.field)
  end

  def test_key_skill
    assert_match(/(\w+\.? ?)/, @tester.key_skill)
  end

  def test_position
    assert_match(/(\w+\.? ?)/, @tester.position)
  end
end
