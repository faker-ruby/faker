require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerPet < Test::Unit::TestCase
  def setup
    @tester = Faker::Pet
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

  def test_type
    assert @tester.type.match(/\w+\.?/)
  end

end
