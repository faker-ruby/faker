# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAgeOfEmpires2 < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::AgeOfEmpires2
  end

  def test_civilization
    assert @tester.civilization.match(/\w+/)
  end

  def test_infantry
    assert @tester.infantry.match(/\w+/)
  end
end
