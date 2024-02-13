# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFmaBrotherhood < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::FmaBrotherhood
  end

  def test_character
    assert_match(/\w+/, @tester.character)
  end

  def test_city
    assert_match(/\w+/, @tester.city)
  end

  def test_country
    assert_match(/\w+/, @tester.country)
  end
end
