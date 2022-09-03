# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSuperhero < Test::Unit::TestCase
  def setup
    @tester = Faker::Superhero
  end

  def test_power
    assert_match @tester.power, /\w+\.?/
  end

  def test_name
    assert_match @tester.name, /\w+\.?/
  end
end
