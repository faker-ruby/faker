# frozen_string_literal: true

require 'minitest/mock'
require_relative '../../test_helper'

class TestFakerJson < Test::Unit::TestCase
  require 'json'

  def test_shallow_json_keeps_width_when_keys_collide
    # Seed 0 draws the same boolean key twice in a row.
    Faker::Config.stub :random, Random.new(0) do
      json = Faker::Json.shallow_json(width: 2, options: { key: 'Boolean.boolean', value: 'Boolean.boolean' })

      assert_equal 2, JSON.parse(json).size
    end
  end

  def test_simple_json_lenght
    expected_result_length = JSON.parse(simple_json).flatten.length

    assert_same(expected_result_length, 6)
  end

  def test_nested_json_length
    result = Faker::Json.add_depth_to_json(json: simple_json, options: { key: 'Name.first_name', value: 'Name.first_name' })

    first_json_length = JSON.parse(result).flatten[1].flatten.length
    second_json_length = JSON.parse(result).flatten[3].flatten.length
    third_json_length = JSON.parse(result).flatten[5].flatten.length

    assert_same(first_json_length, 6)
    assert_same(second_json_length, 6)
    assert_same(third_json_length, 6)
  end

  def test_nested_json_width_length
    json = Faker::Json.add_depth_to_json(json: nested_json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })

    first_json_length = JSON.parse(json).flatten[1].flatten[1].flatten.length
    second_json_length = JSON.parse(json).flatten[3].flatten[3].flatten.length

    assert_same(first_json_length, 6)
    assert_same(second_json_length, 6)
  end

  def simple_json
    Faker::Json.shallow_json(options: { key: 'Name.first_name', value: 'Name.first_name' })
  end

  def nested_json
    Faker::Json.add_depth_to_json(json: simple_json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
  end
end
