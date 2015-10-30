require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerDate < Test::Unit::TestCase
  def setup
    @tester = Faker::Date
  end

  def test_between
    from = Date.parse("2012-01-01")
    to   = Date.parse("2013-01-01")

    100.times do
      random_date = @tester.between(from, to)
      assert random_date >= from, "Expected >= \"#{from}\", but got #{random_date}"
      assert random_date <= to  , "Expected <= \"#{to}\", but got #{random_date}"
    end
  end

  def test_forward
    today = Date.today

    100.times do
      random_date = @tester.forward(5)
      assert random_date > today, "Expected > \"#{today}\", but got #{random_date}"
    end
  end

  def test_backward
    today = Date.today

    100.times do
      random_date = @tester.backward(5)
      assert random_date < today, "Expected < \"#{today}\", but got #{random_date}"
    end
  end

  def test_return_type
    random_forward  = @tester.forward(5)
    random_backward = @tester.backward(5)
    random_between  = @tester.between(Date.today, Date.today + 5)

    [random_forward, random_backward, random_between].each do |result|
      assert result.is_a?(Date), "Expected a Date object, but got #{result.class}"
    end
  end

  def test_invalid_date
    assert_raise ArgumentError do
      @tester.between("9999-99-99", "9999-99-99")
    end
  end

  def test_birthday
    min = 40
    max = 90
    100.times do
      t = Date.today
      date_min = Date.new(t.year - min, t.month, t.day)
      date_max = Date.new(t.year - max, t.month, t.day)
      birthday = @tester.birthday(min, max)
      assert birthday >= date_max, "Expect > \"#{date_max}\", but got #{birthday}"
      assert birthday <= date_min, "Expect > \"#{date_max}\", but got #{birthday}"
    end
  end

  def test_default_birthday
    min = 10
    max = 65
    100.times do
      t = Date.today
      date_min = Date.new(t.year - min, t.month, t.day)
      date_max = Date.new(t.year - max, t.month, t.day)
      birthday = @tester.birthday
      assert birthday >= date_max, "Expect > \"#{date_max}\", but got #{birthday}"
      assert birthday < date_min, "Expect > \"#{date_max}\", but got #{birthday}"
    end
  end
end
