# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMountain < Test::Unit::TestCase
  def setup
    @tester = Faker::Mountain
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_range
    assert @tester.range.match(/\w+/)
  end
end
