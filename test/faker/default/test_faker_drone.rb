# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerDrone < Test::Unit::TestCase
  def setup
    @tester = Faker::Drone
  end

  def test_name
    assert @tester.name.match(/[A-Za-z0-9]+/)
  end

  def test_weight
    assert @tester.weight.match(/[0-9]{3}\sg/)
  end

  def test_max_ascent_speed
    assert @tester.max_ascent_speed.match(/[0-9]\sm\/s/)
  end

  def test_max_descent_speed
    assert @tester.max_descent_speed.match(/[0-9]\sm\/s/)
  end

  def test_max_flight_time
    assert @tester.flight_time.match(/[0-9]{2} min/)
  end

  def test_max_altitude
    assert @tester.max_altitude.match(/[0-9]{4}\sm/)
  end

  def test_max_flight_distance
    assert @tester.max_flight_distance.match(/[0-9]{4}\sm/)
  end

  def test_max_speed
    assert @tester.max_speed.match(/[0-9]{2}\sm\/s/)
  end

  def test_max_wind_resistance
    assert @tester.max_wind_resistance.match(/[0-9]{2}\.[0-9]\sm\/s/)
  end

  def test_max_anngular_velocity
    assert @tester.max_angular_velocity.match(/[0-9]{2}\W\/s/)
  end

  def test_max_tilt_angle
    assert @tester.max_tilt_angle.match(/[0-9]{2}\W/)
  end

  def test_operating_temperature
    assert @tester.operating_temperature.match(/[0-9]{2}\W\-[0-9]{3}\WF/)
  end

  def test_battery_capacity
    assert @tester.battery_capacity.match(/[2-3][0-9]{3}\smAh/)
  end

  def test_battery_type
    assert @tester.battery_type.match(/Li(Po\s|-)[3-4]*[A-Za-z]+/)
  end

  def test_battery_weight
    assert @tester.battery_weight.match(/[0-9]{3}\sg/)
  end

  def test_battery_voltage
    assert @tester.battery_voltage.match(/[0-9]{2}\.[0-9]V/)
  end

  def test_charging_temperature
    assert @tester.charging_temperature.match(/[0-9]{2}\W\-[0-9]{3}\WF/)
  end

  def test_max_charging_power
    assert @tester.max_charging_power.match(/[0-9]{2}W/)
  end

  def test_camera_iso
    assert @tester.iso.match(/(100-3200|100-6400)/)
  end

  def test_max_resolution
    assert @tester.max_resolution.match(/[0-9]{2}MP/)
  end

  def test_photo_format
    assert @tester.photo_format.match(/(JPEG|PNG|TIF)/)
  end

  def video_format
    assert @tester.video_format.match(/MP4|FLV|MOV/)
  end

  def test_max_shutter_speed_range
    assert @tester.shutter_speed_range.match(/[0-9]{1,2}\-1\/[0-9]{1,4}s/)
  end

  def test_max_shutter_speed
    assert @tester.max_shutter_speed.match(/[0-9]{1,2}s/)
  end

  def test_min_shutter_speed
    assert @tester.min_shutter_speed.match(/1\/[0-9]{1,4}s/)
  end
end
