# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAustralia < Test::Unit::TestCase
  def setup
    @tester = Faker::Australia
  end

  def test_location
    assert @tester.location.match(/\w+/)
  end
end
