# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerLebowski < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Lebowski
  end

  def test_actor
    assert_match(/\w+/, @tester.actor)
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
