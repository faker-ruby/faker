# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMarketing < Test::Unit::TestCase
  def setup
    @tester = Faker::Marketing
  end

  def test_buzzwords
    assert_match(/\w+/, @tester.buzzwords)
  end
end
