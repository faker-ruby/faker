# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerRajnikanth < Test::Unit::TestCase
  def setup
    @tester = Faker::Quotes::Rajnikanth
  end

  def test_jokes
    assert_match(/\w+/, @tester.joke)
  end
end
