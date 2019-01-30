# frozen_string_literal: true

require_relative '../test_helper'

class TestDeprecateSuperhero < Test::Unit::TestCase
  def setup
    @tester = Faker::Superhero
  end

  def test_power
    assert @tester.power.match(/\w+\.?/)
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end
end
