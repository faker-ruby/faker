# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHiphop < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Hiphop
  end

  def test_artist
    assert_match(/\w+/, @tester.artist)
  end

  def test_groups
    assert_match(/\w+/, @tester.groups)
  end

  def test_subgenres
    assert_match(/\w+/, @tester.subgenres)
  end
end
