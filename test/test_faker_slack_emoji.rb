require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSlackEmoji < Test::Unit::TestCase

  def setup
    @tester = Faker::SlackEmoji
  end

  def test_people
    assert @tester.people.match(/:\w+:/)
  end

  def test_nature
    assert @tester.nature.match(/:\w+:/)
  end

  def test_food_and_drink
    assert @tester.food_and_drink.match(/:\w+:/)
  end

  def test_celebration
    assert @tester.celebration.match(/:\w+:/)
  end

  def test_activity
    assert @tester.activity.match(/:\w+:/)
  end

  def test_travel_and_places
    assert @tester.travel_and_places.match(/:\w+:/)
  end

  def test_objects_and_symbols
    assert @tester.objects_and_symbols.match(/:\w+:/)
  end

  def test_custom
    assert @tester.custom.match(/:\w+:/)
  end

  def test_emoji
    assert @tester.emoji.match(/:\w+:/)
  end
end