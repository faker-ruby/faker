require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerRestaurant < Test::Unit::TestCase
  def setup
    @tester = Faker::Restaurant
  end

  def test_name
    assert @tester.name.match(/\w+/)
  end

  def test_cuisine
    assert @tester.cuisine.match(/\w+/)
  end

  def test_description
    assert @tester.description.match(/\w+\W+/)
  end

  def test_review
    assert @tester.review.match(/\w+\W+/)
  end

  def test_hours
    assert @tester.hours.all? { |hour| hour.match(/\w+\s\d+\:\d+\s\w+\s\w+\s\d+\:\d+\s\w+/) }
  end

  def test_hours_military
    assert @tester.hours(:military).all? { |hour| hour.match(/\w+\s\d+\:\d+\s\w+\s\d+\:\d+/) }
  end
end
