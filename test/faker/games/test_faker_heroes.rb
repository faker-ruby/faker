# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHeroes < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Heroes
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_specialty
    assert_match @tester.specialty, /\w+/
  end

  def test_klass
    assert_match @tester.klass, /\w+/
  end

  def test_artifact
    assert_match @tester.artifact, /\w+/
  end
end
