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

  def test_between_except
    from     = Date.parse("2012-01-01")
    to       = Date.parse("2012-01-05")
    excepted = Date.parse("2012-01-03")

    100.times do
      random_date = @tester.between_except(from, to, excepted)
      assert_not_nil random_date
      assert random_date != excepted, "Expected != \"#{excepted}\", but got #{random_date}"
    end
  end

  def test_between_except_with_strings
    from     = "2012-01-01"
    to       = "2012-01-05"
    excepted = "2012-01-03"

    excepted_date = Date.parse(excepted)

    100.times do
      random_date = @tester.between_except(from, to, excepted)
      assert_not_nil random_date
      assert random_date != excepted_date, "Expected != \"#{excepted}\", but got #{random_date}"
    end
  end

  def test_between_except_with_same_from_to_and_except
    assert_raise ArgumentError do
      @tester.between_except("2012-01-01", "2012-01-01", "2012-01-01")
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

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    100.times do
      birthday = @tester.birthday(min, max)
      assert birthday >= birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert birthday <= birthdate_max, "Expect <= \"#{birthdate_max}\", but got #{birthday}"
    end
  end

  def test_birthday_when_min_age_equals_max_age
    min = 0
    max = 0

    birthday = @tester.birthday(min, max)

    assert_equal birthday, Date.today
  end

  def test_birthday_on_newborns
    min = 0
    max = 4

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    birthdays = []

    10.times do
      birthday = @tester.birthday(min, max)

      birthdays << birthday

      assert birthday >= birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert birthday <= birthdate_max, "Expect <= \"#{birthdate_max}\", but got #{birthday}"
    end

    assert birthdays.uniq.size > 1
  end

  def test_default_birthday
    min = 10
    max = 65

    t = Date.today
    birthdate_min = Date.new(t.year - max, t.month, t.day)
    birthdate_max = Date.new(t.year - min, t.month, t.day)

    100.times do
      birthday = @tester.birthday
      assert birthday >= birthdate_min, "Expect >= \"#{birthdate_min}\", but got #{birthday}"
      assert birthday < birthdate_max, "Expect < \"#{birthdate_max}\", but got #{birthday}"
    end
  end
end
