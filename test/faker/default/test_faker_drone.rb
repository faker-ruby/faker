# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDrone < Test::Unit::TestCase
  def setup
    @tester = Faker::Drone
  end

  def test_name
    assert_match(/[A-Za-z0-9]+/, @tester.name)
  end

  def test_weight
    assert_match(/[0-9]{3}\sg/, @tester.weight)
  end

  def test_max_ascent_speed
    assert_match(/[0-9]\sm\/s/, @tester.max_ascent_speed)
  end

  def test_max_descent_speed
    assert_match(/[0-9]\sm\/s/, @tester.max_descent_speed)
  end

  def test_max_flight_time
    assert_match(/[0-9]{2} min/, @tester.flight_time)
  end

  def test_max_altitude
    assert_match(/[0-9]{4}\sm/, @tester.max_altitude)
  end

  def test_max_flight_distance
    assert_match(/[0-9]{4}\sm/, @tester.max_flight_distance)
  end

  def test_max_speed
    assert_match(/[0-9]{2}\sm\/s/, @tester.max_speed)
  end

  def test_max_wind_resistance
    assert_match(/[0-9]{2}\.[0-9]\sm\/s/, @tester.max_wind_resistance)
  end

  def test_max_anngular_velocity
    assert_match(/[0-9]{2}\W\/s/, @tester.max_angular_velocity)
  end

  def test_max_tilt_angle
    assert_match(/[0-9]{2}\W/, @tester.max_tilt_angle)
  end

  def test_operating_temperature
    assert_match(/[0-9]{2}\W-[0-9]{3}\WF/, @tester.operating_temperature)
  end

  def test_battery_capacity
    assert_match(/[2-3][0-9]{3}\smAh/, @tester.battery_capacity)
  end

  def test_battery_type
    assert_match(/Li(Po\s|-)[3-4]*[A-Za-z]+/, @tester.battery_type)
  end

  def test_battery_weight
    assert_match(/[0-9]{3}\sg/, @tester.battery_weight)
  end

  def test_battery_voltage
    assert_match(/[0-9]{2}\.[0-9]V/, @tester.battery_voltage)
  end

  def test_charging_temperature
    assert_match(/[0-9]{2}\W-[0-9]{3}\WF/, @tester.charging_temperature)
  end

  def test_max_charging_power
    assert_match(/[0-9]{2}W/, @tester.max_charging_power)
  end

  def test_camera_iso
    assert_match(/(100-3200|100-6400)/, @tester.iso)
  end

  def test_max_resolution
    assert_match(/[0-9]{2}MP/, @tester.max_resolution)
  end

  def test_photo_format
    assert_match(/(JPEG|PNG|TIF)/, @tester.photo_format)
  end

  def video_format
    assert_match(/MP4|FLV|MOV/, @tester.video_format)
  end

  def test_max_shutter_speed_range
    assert_match(/[0-9]{1,2}-1\/[0-9]{1,4}s/, @tester.shutter_speed_range)
  end

  def test_max_shutter_speed
    assert_match(/[0-9]{1,2}s/, @tester.max_shutter_speed)
  end

  def test_min_shutter_speed
    assert_match(/1\/[0-9]{1,4}s/, @tester.min_shutter_speed)
  end
end
