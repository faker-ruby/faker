require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

require 'date'

class TestFakerMoment < Test::Unit::TestCase

  def setup
    @tester = Faker::Moment
  end
  
  def test_date
    assert @tester.date >= Date.new(1970, 1, 1)
    assert @tester.date <= Date.today

    daysago = Date.today - 3
    assert @tester.date(after = daysago) >= daysago
    assert @tester.date(nil, before = daysago) <= daysago
  end
  
  def test_time
    today = Date.today
    thismorning = Time.gm(today.year, today.month, today.day)
    assert @tester.time >= thismorning
    assert @tester.time <= (thismorning + (60 * 60 * 24))

    noon = 60 * 60 * 12
    example = @tester.time(today, after = noon, before = (noon + 3600))
    assert example <= (thismorning + noon + 3600) and example >= (thismorning + noon)
  end
end
