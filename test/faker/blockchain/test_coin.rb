# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBlockchainCoin < Test::Unit::TestCase
  REGEX_COIN_NAME = /[a-zA-Z .]{3,}/
  REGEX_ACRONYM = /\w+{3,}/
  REGEX_URL_LOGO = /^https:\/\/i.imgur.com\/.......\./

  def setup
    @tester = Faker::Blockchain::Coin
  end

  def test_coin_name
    assert_match REGEX_COIN_NAME, @tester.name
  end

  def test_acronym
    assert_match REGEX_ACRONYM, @tester.acronym
  end

  def test_url_logo
    assert_match REGEX_URL_LOGO, @tester.url_logo
  end

  def test_coin_array
    assert_kind_of Array, @tester.coin_array
    assert_match REGEX_COIN_NAME, @tester.coin_array[Faker::Blockchain::Coin::NAME]
    assert_match REGEX_ACRONYM, @tester.coin_array[Faker::Blockchain::Coin::ACRONYM]
    assert_match REGEX_URL_LOGO, @tester.coin_array[Faker::Blockchain::Coin::URL_LOGO]
  end

  def test_coin_hash
    assert_kind_of Hash, @tester.coin_hash
    assert @tester.coin_hash.key?(:name)
    assert @tester.coin_hash.key?(:acronym)
    assert @tester.coin_hash.key?(:url_logo)
  end
end

# deprecated
class TestFakerCryptoCoin < Test::Unit::TestCase
  COIN_NAME = 0
  ACRONYM = 1
  URL_LOGO = 2

  REGEX_COIN_NAME = /[a-zA-Z .]{3,}/
  REGEX_ACRONYM = /\w+{3,}/
  REGEX_URL_LOGO = /^https:\/\/i.imgur.com\/.......\./

  def setup
    Faker::Deprecator.skip_warning do
      @tester = Faker::CryptoCoin
    end
  end

  def test_deprecated_coin_name
    assert_match REGEX_COIN_NAME, @tester.coin_name
  end

  def test_deprecated_acronym
    assert_match REGEX_ACRONYM, @tester.acronym
  end

  def test_deprecated_url_logo
    assert_match REGEX_URL_LOGO, @tester.url_logo
  end

  def test_deprecated_coin_array
    assert_kind_of Array, @tester.coin_array
    assert_match REGEX_COIN_NAME, @tester.coin_array[Faker::Blockchain::Coin::NAME]
    assert_match REGEX_ACRONYM, @tester.coin_array[Faker::Blockchain::Coin::ACRONYM]
    assert_match REGEX_URL_LOGO, @tester.coin_array[Faker::Blockchain::Coin::URL_LOGO]
  end

  def test_deprecated_coin_hash
    assert_kind_of Hash, @tester.coin_hash
    assert @tester.coin_hash.key?(:name)
    assert @tester.coin_hash.key?(:acronym)
    assert @tester.coin_hash.key?(:url_logo)
  end
end
