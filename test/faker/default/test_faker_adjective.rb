# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAdjective < Test::Unit::TestCase
  def setup
    @tester = Faker::Adjective
  end

  def test_nice
    assert @tester.nice.match(/\w+/)
  end

  def test_bad
    assert @tester.bad.match(/\w+/)
  end
end
