# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDisney < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Disney
  end

  def test_princess
    assert @tester.princess.match(/\w+/)
  end

  def test_film
    assert @tester.film.match(/\w+/)
  end
end
