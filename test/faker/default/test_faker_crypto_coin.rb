# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCryptoCoin < Test::Unit::TestCase
  COIN_NAME = 0
  ACRONYM = 1
  URL_LOGO = 2

  REGEX_COIN_NAME = /[a-zA-Z .]{3,}/.freeze
  REGEX_ACRONYM = /\w+{3,}/.freeze
  REGEX_URL_LOGO = /^https:\/\/i.imgur.com\/.......\./.freeze

  def setup
    @tester = Faker::CryptoCoin
  end

  def test_coin_name
    assert_match @tester.coin_name, REGEX_COIN_NAME
  end

  def test_acronym
    assert_match @tester.acronym, REGEX_ACRONYM
  end

  def test_url_logo
    assert_match @tester.url_logo, REGEX_URL_LOGO
  end

  def test_coin_array
    assert_kind_of Array, @tester.coin_array
    assert_match @tester.coin_array[COIN_NAME], REGEX_COIN_NAME
    assert_match @tester.coin_array[ACRONYM], REGEX_ACRONYM
    assert_match @tester.coin_array[URL_LOGO], REGEX_URL_LOGO
  end

  def test_coin_hash
    assert_kind_of Hash, @tester.coin_hash
    assert @tester.coin_hash.key?(:name)
    assert @tester.coin_hash.key?(:acronym)
    assert @tester.coin_hash.key?(:url_logo)
  end
end
