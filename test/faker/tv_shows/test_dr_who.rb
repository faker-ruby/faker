# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDrWho < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DrWho
    Faker::Config.locale = nil
  end

  def test_character
    10.times { assert_match @tester.character, /\w+/ }
  end

  def test_the_doctor
    10.times { assert_match @tester.the_doctor, /\w+/ }
  end

  def test_actor
    10.times { assert_match @tester.actor, /\w+/ }
  end

  def test_catch_phrase
    10.times { assert_match @tester.catch_phrase, /\w+/ }
  end

  def test_quote
    10.times { assert_match @tester.quote, /\w+/ }
  end

  # deprecated
  def test_villian
    10.times { assert_match @tester.villian, /\w+/ }
  end

  def test_villain
    10.times { assert_match @tester.villain, /\w+/ }
  end

  def test_specie
    10.times { assert_match @tester.specie, /\w+/ }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'
      assert @tester.character.is_a? String
      assert @tester.the_doctor.is_a? String
      assert @tester.catch_phrase.is_a? String
      assert @tester.quote.is_a? String
      assert @tester.villian.is_a? String # deprecated
      assert @tester.villain.is_a? String
      assert @tester.specie.is_a? String
    end
  end
end
