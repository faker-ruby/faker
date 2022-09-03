# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHiphop < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Hiphop
  end

  def test_artist
    assert_match @tester.artist, /\w+/
  end

  def test_groups
    assert_match @tester.groups, /\w+/
  end

  def test_subgenres
    assert_match @tester.subgenres, /\w+/
  end
end
