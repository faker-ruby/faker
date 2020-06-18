# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerMarketing < Test::Unit::TestCase
  def setup
    @tester = Faker::Marketing
  end

  def test_buzzwords
    assert @tester.buzzwords.match?(/\w+/)
  end
end
