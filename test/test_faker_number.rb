require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerNumber < Test::Unit::TestCase
  def setup
    @tester = Faker::Number
  end

  def test_number
    assert @tester.number(10).match(/[0-9]{10}/)
    10.times do |digits|
      digits += 1
      assert @tester.number(digits).match(/^[0-9]{#{digits}}$/)
    end
  end

  def test_decimal
    assert @tester.decimal(2).match(/[0-9]{2}\.[0-9]{2}/)
    assert @tester.decimal(4, 5).match(/[0-9]{4}\.[0-9]{5}/)
  end

  def test_digit
    assert @tester.digit.match(/[0-9]{1}/)
  end

  def test_between
    100.times do
      random_number = @tester.between(-50, 50)
      assert random_number >= -50, "Expected >= -50, but got #{random_number}"
      assert random_number <=  50, "Expected <= 50, but got #{random_number}"
    end
  end

  def test_positive
    100.times do
      random_number = @tester.positive(1, 100)
      assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
      assert random_number <= 100, "Expected <= 100, but got #{random_number}"
    end
  end

  def test_negative
    100.times do
      random_number = @tester.negative(-1, -100)
      assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
      assert random_number >= -100, "Expected >= -100, but got #{random_number}"
    end
  end

  def test_force_positive
    random_number = @tester.positive(-1, -100)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end

  def test_force_negative
    random_number = @tester.negative(1, 100)
    assert random_number <= -1,   "Expected <= -1, but got #{random_number}"
    assert random_number >= -100, "Expected >= -100, but got #{random_number}"
  end

  def test_parameters_order
    random_number = @tester.between(100, 1)
    assert random_number >= 1,   "Expected >= 1, but got #{random_number}"
    assert random_number <= 100, "Expected <= 100, but got #{random_number}"
  end
end
