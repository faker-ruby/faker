# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJob < Test::Unit::TestCase
  def setup
    @tester = Faker::Job
  end

  def test_title
    assert @tester.title.match(/(\w+\.? ?){2,3}/)
  end

  def test_field
    assert @tester.field.match(/(\w+\.? ?)/)
  end

  def test_key_skill
    assert @tester.key_skill.match(/(\w+\.? ?)/)
  end

  def test_position
    assert @tester.position.match(/(\w+\.? ?)/)
  end
end
