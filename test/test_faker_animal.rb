# frozen_string_literal: true

require_relative 'test_helper'
class TestFakerAnimal < Test::Unit::TestCase
  def setup
    @tester = Faker::Animal
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end
end
