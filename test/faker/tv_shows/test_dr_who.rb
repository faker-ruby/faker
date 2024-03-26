# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTvShowsDrWho < Test::Unit::TestCase
  def setup
    @tester = Faker::TvShows::DrWho
    Faker::Config.locale = nil
  end

  def test_character
    deterministically_verify(-> { @tester.character }) { |result| assert_match(/\w+/, result) }
  end

  def test_the_doctor
    deterministically_verify(-> { @tester.the_doctor }) { |result| assert_match(/\w+/, result) }
  end

  def test_actor
    deterministically_verify(-> { @tester.actor }) { |result| assert_match(/\w+/, result) }
  end

  def test_catch_phrase
    deterministically_verify(-> { @tester.catch_phrase }) { |result| assert_match(/\w+/, result) }
  end

  def test_quote
    deterministically_verify(-> { @tester.quote }) { |result| assert_match(/\w+/, result) }
  end

  # deprecated
  def test_villian
    deterministically_verify(-> { @tester.villian }) { |result| assert_match(/\w+/, result) }
  end

  def test_villain
    deterministically_verify(-> { @tester.villain }) { |result| assert_match(/\w+/, result) }
  end

  def test_specie
    deterministically_verify(-> { @tester.specie }) { |result| assert_match(/\w+/, result) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'

      assert_kind_of String, @tester.character
      assert_kind_of String, @tester.the_doctor
      assert_kind_of String, @tester.catch_phrase
      assert_kind_of String, @tester.quote
      assert_kind_of String, @tester.villian # deprecated
      assert_kind_of String, @tester.villain
      assert_kind_of String, @tester.specie
    end
  end
end
