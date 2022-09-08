# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSuperhero < Test::Unit::TestCase
  def setup
    @tester = Faker::Superhero
  end

  def test_power
    assert_match(/\w+\.?/, @tester.power)
  end

  def test_name
    assert_match(/\w+\.?/, @tester.name)
  end
end
