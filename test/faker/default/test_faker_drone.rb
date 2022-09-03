# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDrone < Test::Unit::TestCase
  def setup
    @tester = Faker::Drone
  end

  def test_name
    assert_match @tester.name, /[A-Za-z0-9]+/
  end

  def test_weight
    assert_match @tester.weight, /[0-9]{3}\sg/
  end

  def test_max_ascent_speed
    assert_match @tester.max_ascent_speed, /[0-9]\sm\/s/
  end

  def test_max_descent_speed
    assert_match @tester.max_descent_speed, /[0-9]\sm\/s/
  end

  def test_max_flight_time
    assert_match @tester.flight_time, /[0-9]{2} min/
  end

  def test_max_altitude
    assert_match @tester.max_altitude, /[0-9]{4}\sm/
  end

  def test_max_flight_distance
    assert_match @tester.max_flight_distance, /[0-9]{4}\sm/
  end

  def test_max_speed
    assert_match @tester.max_speed, /[0-9]{2}\sm\/s/
  end

  def test_max_wind_resistance
    assert_match @tester.max_wind_resistance, /[0-9]{2}\.[0-9]\sm\/s/
  end

  def test_max_anngular_velocity
    assert_match @tester.max_angular_velocity, /[0-9]{2}\W\/s/
  end

  def test_max_tilt_angle
    assert_match @tester.max_tilt_angle, /[0-9]{2}\W/
  end

  def test_operating_temperature
    assert_match @tester.operating_temperature, /[0-9]{2}\W-[0-9]{3}\WF/
  end

  def test_battery_capacity
    assert_match @tester.battery_capacity, /[2-3][0-9]{3}\smAh/
  end

  def test_battery_type
    assert_match @tester.battery_type, /Li(Po\s|-)[3-4]*[A-Za-z]+/
  end

  def test_battery_weight
    assert_match @tester.battery_weight, /[0-9]{3}\sg/
  end

  def test_battery_voltage
    assert_match @tester.battery_voltage, /[0-9]{2}\.[0-9]V/
  end

  def test_charging_temperature
    assert_match @tester.charging_temperature, /[0-9]{2}\W-[0-9]{3}\WF/
  end

  def test_max_charging_power
    assert_match @tester.max_charging_power, /[0-9]{2}W/
  end

  def test_camera_iso
    assert_match @tester.iso, /(100-3200|100-6400)/
  end

  def test_max_resolution
    assert_match @tester.max_resolution, /[0-9]{2}MP/
  end

  def test_photo_format
    assert_match @tester.photo_format, /(JPEG|PNG|TIF)/
  end

  def video_format
    assert_match @tester.video_format, /MP4|FLV|MOV/
  end

  def test_max_shutter_speed_range
    assert_match @tester.shutter_speed_range, /[0-9]{1,2}-1\/[0-9]{1,4}s/
  end

  def test_max_shutter_speed
    assert_match @tester.max_shutter_speed, /[0-9]{1,2}s/
  end

  def test_min_shutter_speed
    assert_match @tester.min_shutter_speed, /1\/[0-9]{1,4}s/
  end
end
