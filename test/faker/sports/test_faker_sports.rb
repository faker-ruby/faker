# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSports < Test::Unit::TestCase
  def setup
    @tester = Faker::Sports
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_name_with_seed_42
    Faker::Config.random = Random.new(42)
    assert @tester.name == 'Streetluge'
    Faker::Config.random = Random.new(100)
    assert @tester.name == 'Skydiving'
  end
end
