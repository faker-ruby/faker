# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDeparted < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Departed
  end

  def test_actor
    assert @tester.actor.match?(/\w+/)
  end

  def test_character
    assert @tester.character.match?(/\w+/)
  end

  def test_quote
    assert @tester.quote.match?(/\w+/)
  end
end
