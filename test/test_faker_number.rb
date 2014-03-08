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

end
