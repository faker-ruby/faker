require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerAdvertiserId < Test::Unit::TestCase

  def setup
    @tester = Faker::AdvertiserId
  end

  def test_id
    assert @tester.id.match(/^[A-Z0-9]{8}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{12}\Z/)
  end
end
