# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRush < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Rush
  end

  def test_player
    assert_match @tester.player, /\w+/
  end

  def test_album
    assert_match @tester.album, /\w+/
  end
end
