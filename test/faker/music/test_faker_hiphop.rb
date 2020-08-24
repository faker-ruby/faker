# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHiphop < Test::Unit::TestCase
  def setup
    @tester = Faker::Music::Hiphop
  end

  def test_artist
    assert @tester.artist.match(/\w+/)
  end

  def test_groups
    assert @tester.groups.match(/\w+/)
  end

  def test_subgenres
    assert @tester.subgenres.match(/\w+/)
  end
end
