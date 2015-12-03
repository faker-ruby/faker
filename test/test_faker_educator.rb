require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerEducator < Test::Unit::TestCase

  def setup
    @tester = Faker::Educator
  end

  def test_university
    assert @tester.university.match(/(\w+\.? ?){2,3}/)
  end

  def test_secondary_school
    assert @tester.secondary_school.match(/(\w+\.? ?){2,3}/)
  end

end
