# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerHackers < Test::Unit::TestCase
  def setup
    @tester = Faker::Movies::Hackers
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_handle
    assert_match(/\w+/, @tester.handle)
  end

  def test_quote
    assert_match(/\w+/, @tester.quote)
  end
end
