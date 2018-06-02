require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerName < Test::Unit::TestCase
  def setup
    @tester = Faker::Name
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_name_with_middle
    assert @tester.name_with_middle.match(/(\w+\.? ?){3,4}/)
  end

  def test_first_name
    assert @tester.first_name.match(/(\w+\.? ?){3,4}/)
  end

  def test_last_name
    assert @tester.last_name.match(/(\w+\.? ?){3,4}/)
  end

  def test_prefix
    assert @tester.prefix.match(/[A-Z][a-z]+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/[A-Z][a-z]*\.?/)
  end

  def test_job_titles
    @job_titles = Faker::Name.job_titles
    @job_titles.each do |title|
      refute title.to_s.empty?
    end
  end

  def test_initials
    assert @tester.initials.match(/[A-Z]{3}/)
    assert @tester.initials(2).match(/[A-Z]{2}/)
  end
end
