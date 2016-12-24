require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerUniqueGenerator < Test::Unit::TestCase

  def test_generates_unique_values
    generator = Faker::UniqueGenerator.new(Faker::Base, 10_000)

    result = [generator.rand_in_range(1, 2), generator.rand_in_range(1, 2)]
    assert_equal([1, 2], result.sort)
  end

  def test_returns_error_when_retries_exceeded
    stubbed_generator = Object.new
    def stubbed_generator.test
      1
    end

    generator = Faker::UniqueGenerator.new(stubbed_generator, 3)

    generator.test

    assert_raises Faker::UniqueGenerator::RetryLimitExceeded do
      generator.test
    end
  end

end
