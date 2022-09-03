# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseKamenRider < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::KamenRider
  end

  def test_kamen_rider
    assert_match @tester.kamen_rider, /\w+\.?/
  end

  def test_kamen_rider_showa
    assert_match @tester.kamen_rider(:showa), /\w+\.?/
  end

  def test_kamen_rider_heisei
    assert_match @tester.kamen_rider(:heisei), /\w+\.?/
  end

  def test_kamen_rider_reiwa
    assert_match @tester.kamen_rider(:reiwa), /\w+\.?/
  end

  def test_kamen_rider_heisei_reiwa
    assert_match @tester.kamen_rider(:heisei, :reiwa), /\w+\.?/
  end

  def test_user_all
    assert_match @tester.user, /\w+\.?/
  end

  def test_user_showa
    assert_match @tester.user(:showa), /\w+\.?/
  end

  def test_user_heisei
    assert_match @tester.user(:heisei), /\w+\.?/
  end

  def test_user_reiwa
    assert_match @tester.user(:reiwa), /\w+\.?/
  end

  def test_user_heisei_reiwa
    assert_match @tester.user(:heisei, :reiwa), /\w+\.?/
  end

  def test_series_all
    assert_match @tester.series, /\w+\.?/
  end

  def test_series_showa
    assert_match @tester.series(:showa), /\w+\.?/
  end

  def test_series_heisei
    assert_match @tester.series(:heisei), /\w+\.?/
  end

  def test_series_reiwa
    assert_match @tester.series(:reiwa), /\w+\.?/
  end

  def test_series_heisei_reiwa
    assert_match @tester.series(:heisei, :reiwa), /\w+\.?/
  end

  def test_collectible_device_all
    assert_match @tester.collectible_device, /\w+\.?/
  end

  # The Showa era had not introduced the concept of collectible devices.
  def test_collectible_device_showa
    assert_raise('Faker::JapaneseMedia::KamenRider::UnavailableInEra') { @tester.collectible_device(:showa) }
  end

  def test_collectible_device_heisei
    assert_match @tester.collectible_device(:heisei), /\w+\.?/
  end

  def test_collectible_device_reiwa
    assert_match @tester.collectible_device(:reiwa), /\w+\.?/
  end

  def test_collectible_device_heisei_reiwa
    assert_match @tester.collectible_device(:heisei, :reiwa), /\w+\.?/
  end

  def test_transformation_device_all
    assert_match @tester.transformation_device, /\w+\.?/
  end

  def test_transformation_device_showa
    assert_match @tester.transformation_device(:showa), /\w+\.?/
  end

  def test_transformation_device_heisei
    assert_match @tester.transformation_device(:heisei), /\w+\.?/
  end

  def test_transformation_device_reiwa
    assert_match @tester.transformation_device(:reiwa), /\w+\.?/
  end

  def test_transformation_device_heisei_reiwa
    assert_match @tester.transformation_device(:heisei, :reiwa), /\w+\.?/
  end
end
