# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFmaBrotherhood < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::FmaBrotherhood
  end

  def test_character
    assert @tester.character.match(/\w+/)
  end
end
