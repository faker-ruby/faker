# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDrWho < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DrWho
    Faker::Config.locale = nil
  end

  def test_character
    deterministically_verify(-> { @tester.character }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_the_doctor
    deterministically_verify(-> { @tester.the_doctor }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_actor
    deterministically_verify(-> { @tester.actor }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_catch_phrase
    deterministically_verify(-> { @tester.catch_phrase }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_quote
    deterministically_verify(-> { @tester.quote }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  # deprecated
  def test_villian
    deterministically_verify(-> { @tester.villian }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_villain
    deterministically_verify(-> { @tester.villain }, depth: 5) { |result| assert_match(/\w+/, result) }
  end

  def test_specie
    deterministically_verify(-> { @tester.specie }, depth: 5) { |result| assert_match(/\w+/, result) }
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
