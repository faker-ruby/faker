require_relative '../../test_helper'

class TestFakerJson < Test::Unit::TestCase
  require 'json'

  def setup
    @tester = Faker::Json
  end

  def test_shallow_json
    json = Faker::Json.shallow_json(width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
    assert JSON.parse(json).flatten.length.equal?(6)
  end

  def test_add_depth_to_json
    json = Faker::Json.shallow_json(width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
    json = Faker::Json.add_depth_to_json(json: json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
    assert JSON.parse(json).flatten[1].flatten.length.equal?(6)
    assert JSON.parse(json).flatten[3].flatten.length.equal?(6)
    assert JSON.parse(json).flatten[5].flatten.length.equal?(6)

    json = Faker::Json.add_depth_to_json(json: json, width: 3, options: { key: 'Name.first_name', value: 'Name.first_name' })
    assert JSON.parse(json).flatten[1].flatten[1].flatten.length.equal?(6)
    assert JSON.parse(json).flatten[3].flatten[3].flatten.length.equal?(6)
    assert JSON.parse(json).flatten[5].flatten[5].flatten.length.equal?(6)
  end
end
