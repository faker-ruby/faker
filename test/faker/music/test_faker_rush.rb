# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRush < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Rush
  end

  def test_player
    assert @tester.player.match(/\w+/)
  end

  def test_album
    assert @tester.album.match(/\w+/)
  end
end
