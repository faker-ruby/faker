# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMoviesGhostbusters < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Ghostbusters
  end

  def test_actor
    assert_match @tester.actor, /\w+/
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
