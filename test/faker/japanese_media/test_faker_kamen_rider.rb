# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseKamenRider < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::KamenRider
  end

  def test_kamen_rider
    assert_match(/\w+\.?/, @tester.kamen_rider)
  end

  def test_kamen_rider_showa
    assert_match(/\w+\.?/, @tester.kamen_rider(:showa))
  end

  def test_kamen_rider_heisei
    assert_match(/\w+\.?/, @tester.kamen_rider(:heisei))
  end

  def test_kamen_rider_reiwa
    assert_match(/\w+\.?/, @tester.kamen_rider(:reiwa))
  end

  def test_kamen_rider_heisei_reiwa
    assert_match(/\w+\.?/, @tester.kamen_rider(:heisei, :reiwa))
  end

  def test_user_all
    assert_match(/\w+\.?/, @tester.user)
  end

  def test_user_showa
    assert_match(/\w+\.?/, @tester.user(:showa))
  end

  def test_user_heisei
    assert_match(/\w+\.?/, @tester.user(:heisei))
  end

  def test_user_reiwa
    assert_match(/\w+\.?/, @tester.user(:reiwa))
  end

  def test_user_heisei_reiwa
    assert_match(/\w+\.?/, @tester.user(:heisei, :reiwa))
  end

  def test_series_all
    assert_match(/\w+\.?/, @tester.series)
  end

  def test_series_showa
    assert_match(/\w+\.?/, @tester.series(:showa))
  end

  def test_series_heisei
    assert_match(/\w+\.?/, @tester.series(:heisei))
  end

  def test_series_reiwa
    assert_match(/\w+\.?/, @tester.series(:reiwa))
  end

  def test_series_heisei_reiwa
    assert_match(/\w+\.?/, @tester.series(:heisei, :reiwa))
  end

  def test_collectible_device_all
    assert_match(/\w+\.?/, @tester.collectible_device)
  end

  # The Showa era had not introduced the concept of collectible devices.
  def test_collectible_device_showa
    assert_raise('Faker::JapaneseMedia::KamenRider::UnavailableInEra') { @tester.collectible_device(:showa) }
  end

  def test_collectible_device_heisei
    assert_match(/\w+\.?/, @tester.collectible_device(:heisei))
  end

  def test_collectible_device_reiwa
    assert_match(/\w+\.?/, @tester.collectible_device(:reiwa))
  end

  def test_collectible_device_heisei_reiwa
    assert_match(/\w+\.?/, @tester.collectible_device(:heisei, :reiwa))
  end

  def test_transformation_device_all
    assert_match(/\w+\.?/, @tester.transformation_device)
  end

  def test_transformation_device_showa
    assert_match(/\w+\.?/, @tester.transformation_device(:showa))
  end

  def test_transformation_device_heisei
    assert_match(/\w+\.?/, @tester.transformation_device(:heisei))
  end

  def test_transformation_device_reiwa
    assert_match(/\w+\.?/, @tester.transformation_device(:reiwa))
  end

  def test_transformation_device_heisei_reiwa
    assert_match(/\w+\.?/, @tester.transformation_device(:heisei, :reiwa))
  end
end
