require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestSeeding < Test::Unit::TestCase
  def setup; end

  def test_deterministic
    Faker::Config.random = Random.new(5)
    first_random = Faker::Number.number(100_000)
    Faker::Config.random = Random.new(5)
    second_random = Faker::Number.number(100_000)
    Faker::Config.random = Random.new
    Faker::Config.random = nil
    third_random = Faker::Number.number(100_000)

    assert first_random == second_random
    # Tiny chance this will fail randomly if the unseeded Random just so
    # happen generates the same number as Random.new(5)
    assert first_random != third_random
  end
end
