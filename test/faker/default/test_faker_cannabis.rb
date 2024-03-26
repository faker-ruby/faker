# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCannabis < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_strain
    deterministically_verify(-> { Faker::Cannabis.strain }) { |result| assert_match(/\w+/, result) }
  end

  def test_cannabinoid_abbreviation
    deterministically_verify(-> { Faker::Cannabis.cannabinoid_abbreviation }) { |result| assert_match(/\w+/, result) }
  end

  def test_cannabinoid
    deterministically_verify(-> { Faker::Cannabis.cannabinoid }) { |result| assert_match(/\w+/, result) }
  end

  def test_terpene
    deterministically_verify(-> { Faker::Cannabis.terpene }) { |result| assert_match(/\w+/, result) }
  end

  def test_medical_use
    deterministically_verify(-> { Faker::Cannabis.medical_use }) { |result| assert_match(/\w+/, result) }
  end

  def test_health_benefit
    deterministically_verify(-> { Faker::Cannabis.health_benefit }) { |result| assert_match(/\w+/, result) }
  end

  def test_category
    deterministically_verify(-> { Faker::Cannabis.category }) { |result| assert_match(/\w+/, result) }
  end

  def test_type
    deterministically_verify(-> { Faker::Cannabis.type }) { |result| assert_match(/\w+/, result) }
  end

  def test_buzzword
    deterministically_verify(-> { Faker::Cannabis.buzzword }) { |result| assert_match(/\w+/, result) }
  end

  def test_brand
    deterministically_verify(-> { Faker::Cannabis.brand }) { |result| assert_match(/\w+/, result) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'

      assert_kind_of String, Faker::Cannabis.strain
      assert_kind_of String, Faker::Cannabis.cannabinoid_abbreviation
      assert_kind_of String, Faker::Cannabis.cannabinoid
      assert_kind_of String, Faker::Cannabis.terpene
      assert_kind_of String, Faker::Cannabis.medical_use
      assert_kind_of String, Faker::Cannabis.health_benefit
      assert_kind_of String, Faker::Cannabis.category
      assert_kind_of String, Faker::Cannabis.type
      assert_kind_of String, Faker::Cannabis.buzzword
      assert_kind_of String, Faker::Cannabis.brand
    end
  end
end
