# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCannabis < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_strain
    deterministically_verify(-> { Faker::Cannabis.strain }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_cannabinoid_abbreviation
    deterministically_verify(-> { Faker::Cannabis.cannabinoid_abbreviation }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_cannabinoid
    deterministically_verify(-> { Faker::Cannabis.cannabinoid }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_terpene
    deterministically_verify(-> { Faker::Cannabis.terpene }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_medical_use
    deterministically_verify(-> { Faker::Cannabis.medical_use }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_health_benefit
    deterministically_verify(-> { Faker::Cannabis.health_benefit }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_category
    deterministically_verify(-> { Faker::Cannabis.category }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_type
    deterministically_verify(-> { Faker::Cannabis.type }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_buzzword
    deterministically_verify(-> { Faker::Cannabis.buzzword }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_brand
    deterministically_verify(-> { Faker::Cannabis.brand }, depth: 10) { |result| assert_match(/\w+/, result) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'

      assert Faker::Cannabis.strain.is_a? String
      assert Faker::Cannabis.cannabinoid_abbreviation.is_a? String
      assert Faker::Cannabis.cannabinoid.is_a? String
      assert Faker::Cannabis.terpene.is_a? String
      assert Faker::Cannabis.medical_use.is_a? String
      assert Faker::Cannabis.health_benefit.is_a? String
      assert Faker::Cannabis.category.is_a? String
      assert Faker::Cannabis.type.is_a? String
      assert Faker::Cannabis.buzzword.is_a? String
      assert Faker::Cannabis.brand.is_a? String
    end
  end
end
