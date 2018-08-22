# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerCryptoCoin < Test::Unit::TestCase
  def setup
    @tester = Faker::CryptoCoin
  end

  def test_coin_name
    assert @tester.coin_name.match(/\w+{4,}/)
  end

  def test_acronym
    assert @tester.acronym.match(/\w+{3,}/)
  end
  
  def test_url_logo
    assert @tester.url_logo.match(/^https:\/\/imgur.com\/a\/......./)
  end
  
  def test_coin_hash
    assert_kind_of Hash, @tester.coin_hash
    assert @tester.coin_hash.has_key?(:name)
    assert @tester.coin_hash.has_key?(:acronym)
    assert @tester.coin_hash.has_key?(:url_logo)
  end
end
