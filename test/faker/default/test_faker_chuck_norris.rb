# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerChuckNorris < Test::Unit::TestCase
  def setup
    @tester = Faker::ChuckNorris
  end

  def test_fact
    assert_match @tester.fact, /.*chuck.*/i
  end
end
