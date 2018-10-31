# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerHeroes < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::Heroes
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_specialty
    assert @tester.specialty.match(/\w+/)
  end

  def test_klass
    assert @tester.klass.match(/\w+/)
  end
end
