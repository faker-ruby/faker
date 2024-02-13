# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMountain < Test::Unit::TestCase
  def setup
    @tester = Faker::Mountain
  end

  def test_name
    assert_match(/\w+/, @tester.name)
  end

  def test_range
    assert_match(/\w+/, @tester.range)
  end
end
