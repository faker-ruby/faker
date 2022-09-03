# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerGreekPhilosophers < Test::Unit::TestCase
  def setup
    @tester = Faker::GreekPhilosophers
  end

  def test_name
    assert_match @tester.name, /\w+/
  end

  def test_quote
    assert_match @tester.quote, /\w+/
  end
end
