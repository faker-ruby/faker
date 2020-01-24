# frozen_string_literal: true

require_relative '../../test_helper'

class TestWarhammerFantasy < Test::Unit::TestCase
  def setup
    @tester = Faker::Games::WarhammerFantasy
  end

  def test_heroes
    assert @tester.hero.match(/\w+/)
  end

  def test_quotes
    assert @tester.quote.match(/\w+/)
  end

  def test_locations
    assert @test.location.match(/\w+/)
  end
end
