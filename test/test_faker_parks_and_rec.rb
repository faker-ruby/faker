# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerParksAndRec < Test::Unit::TestCase
  def setup
    @tester = Faker::TV::ParksAndRec
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end

  def test_city
    assert @tester.city.match(/\w+/)
  end
end
