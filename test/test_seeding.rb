require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestSeeding < Test::Unit::TestCase
  def setup
  end

  def test_deterministic
    Faker::Config.random = Random.new(5)
    first_random = Faker::Number.number(1000)
    Faker::Config.random = Random.new(5)
    second_random = Faker::Number.number(1000)
    Faker::Config.random = Random.new
    third_random = Faker::Number.number(1000)

    assert first_random == second_random

    # Small chance this will fail randomly
    assert first_random != third_random
  end

end