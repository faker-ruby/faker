# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDrWho < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DrWho
    Faker::Config.locale = nil
  end

  def test_character
    10.times { assert_match(/\w+/, @tester.character) }
  end

  def test_the_doctor
    10.times { assert_match(/\w+/, @tester.the_doctor) }
  end

  def test_actor
    10.times { assert_match(/\w+/, @tester.actor) }
  end

  def test_catch_phrase
    10.times { assert_match(/\w+/, @tester.catch_phrase) }
  end

  def test_quote
    10.times { assert_match(/\w+/, @tester.quote) }
  end

  # deprecated
  def test_villian
    10.times { assert_match(/\w+/, @tester.villian) }
  end

  def test_villain
    10.times { assert_match(/\w+/, @tester.villain) }
  end

  def test_specie
    10.times { assert_match(/\w+/, @tester.specie) }
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
