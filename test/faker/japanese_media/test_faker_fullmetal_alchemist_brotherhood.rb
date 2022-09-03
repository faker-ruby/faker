# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFmaBrotherhood < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::FmaBrotherhood
  end

  def test_character
    assert_match @tester.character, /\w+/
  end

  def test_city
    assert_match @tester.city, /\w+/
  end

  def test_country
    assert_match @tester.country, /\w+/
  end
end
