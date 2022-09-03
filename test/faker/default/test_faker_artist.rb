# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerArtist < Test::Unit::TestCase
  def setup
    @tester = Faker::Artist
  end

  def test_name
    assert_match @tester.name, /\w+/
  end
end
