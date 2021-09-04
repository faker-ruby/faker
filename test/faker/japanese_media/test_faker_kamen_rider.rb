# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerJapaneseKamenRider < Test::Unit::TestCase
  def setup
    @tester = Faker::JapaneseMedia::KamenRider
  end

  def test_kamen_rider
    assert @tester.kamen_rider.match(/\w+\.?/)
  end

  def test_kamen_rider_showa
    assert @tester.kamen_rider(:showa).match(/\w+\.?/)
  end

  def test_kamen_rider_heisei
    assert @tester.kamen_rider(:heisei).match(/\w+\.?/)
  end

  def test_kamen_rider_reiwa
    assert @tester.kamen_rider(:reiwa).match(/\w+\.?/)
  end

  def test_kamen_rider_heisei_reiwa
    assert @tester.kamen_rider(:heisei, :reiwa).match(/\w+\.?/)
  end

  def test_user_all
    assert @tester.user.match(/\w+\.?/)
  end

  def test_user_showa
    assert @tester.user(:showa).match(/\w+\.?/)
  end

  def test_user_heisei
    assert @tester.user(:heisei).match(/\w+\.?/)
  end

  def test_user_reiwa
    assert @tester.user(:reiwa).match(/\w+\.?/)
  end

  def test_user_heisei_reiwa
    assert @tester.user(:heisei, :reiwa).match(/\w+\.?/)
  end

  def test_series_all
    assert @tester.series.match(/\w+\.?/)
  end

  def test_series_showa
    assert @tester.series(:showa).match(/\w+\.?/)
  end

  def test_series_heisei
    assert @tester.series(:heisei).match(/\w+\.?/)
  end

  def test_series_reiwa
    assert @tester.series(:reiwa).match(/\w+\.?/)
  end

  def test_series_heisei_reiwa
    assert @tester.series(:heisei, :reiwa).match(/\w+\.?/)
  end

  def test_collectible_device_all
    assert @tester.collectible_device.match(/\w+\.?/)
  end

  # The Showa era had not introduced the concept of collectible devices.
  def test_collectible_device_showa
    assert_raise('Faker::JapaneseMedia::KamenRider::UnavailableInEra') { @tester.collectible_device(:showa) }
  end

  def test_collectible_device_heisei
    assert @tester.collectible_device(:heisei).match(/\w+\.?/)
  end

  def test_collectible_device_reiwa
    assert @tester.collectible_device(:reiwa).match(/\w+\.?/)
  end

  def test_collectible_device_heisei_reiwa
    assert @tester.collectible_device(:heisei, :reiwa).match(/\w+\.?/)
  end
end
