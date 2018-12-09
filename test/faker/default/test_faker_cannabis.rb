# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCannabis < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_strain
    10.times { assert Faker::Cannabis.strain.match(/[\w]+/) }
  end

  def test_cannabinoid_abbreviation
    10.times { assert Faker::Cannabis.cannabinoid_abbreviation.match(/[\w]+/) }
  end

  def test_cannabinoid
    10.times { assert Faker::Cannabis.cannabinoid.match(/[\w]+/) }
  end

  def test_terpene
    10.times { assert Faker::Cannabis.terpene.match(/[\w]+/) }
  end

  def test_medical_use
    10.times { assert Faker::Cannabis.medical_use.match(/[\w]+/) }
  end

  def test_health_benefit
    10.times { assert Faker::Cannabis.health_benefit.match(/[\w]+/) }
  end

  def test_category
    10.times { assert Faker::Cannabis.category.match(/[\w]+/) }
  end

  def test_type
    10.times { assert Faker::Cannabis.type.match(/[\w]+/) }
  end

  def test_buzzword
    10.times { assert Faker::Cannabis.buzzword.match(/[\w]+/) }
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
    end
  end
end
