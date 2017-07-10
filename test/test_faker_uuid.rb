require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerUuid < Test::Unit::TestCase
  def setup
    @tester = Faker::Uuid
  end

  def test_uuid
    assert @tester.uuid.match(/\w+/)
  end

end
