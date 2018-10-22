# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDrWho < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DrWho
    Faker::Config.locale = nil
  end

  def test_character
    10.times { assert @tester.character.match(/[\w]+/) }
  end

  def test_the_doctor
    10.times { assert @tester.the_doctor.match(/[\w]+/) }
  end

  def test_actor
    10.times { assert @tester.actor.match(/[\w]+/) }
  end

  def test_catch_phrase
    10.times { assert @tester.catch_phrase.match(/[\w]+/) }
  end

  def test_quote
    10.times { assert @tester.quote.match(/[\w]+/) }
  end

  def test_villian
    10.times { assert @tester.villian.match(/[\w]+/) }
  end

  def test_specie
    10.times { assert @tester.specie.match(/[\w]+/) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'
      assert @tester.character   .is_a? String
      assert @tester.the_doctor  .is_a? String
      assert @tester.catch_phrase.is_a? String
      assert @tester.quote       .is_a? String
      assert @tester.villian     .is_a? String
      assert @tester.specie      .is_a? String
    end
  end
end
