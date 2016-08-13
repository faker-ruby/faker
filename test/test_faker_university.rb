require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerUniversity < Test::Unit::TestCase
  def setup
    @tester = Faker::University
  end

  def test_prefix
    assert @tester.prefix.match(/\w+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/\w+\.?/)
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

end
