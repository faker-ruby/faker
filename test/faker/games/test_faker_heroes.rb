# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHeroes < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Heroes
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_specialty
    assert_match(/\w+/, @tester.specialty)
  end

  def test_klass
    assert_match(/\w+/, @tester.klass)
  end

  def test_artifact
    assert_match(/\w+/, @tester.artifact)
  end
end
