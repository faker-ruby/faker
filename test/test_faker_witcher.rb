require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerWitcher < Test::Unit::TestCase
  def setup
    @witcher = Faker::Witcher
  end

  def test_character
    assert @witcher.character.match(/(\w+\.? ?){2,3}/)
  end

  def test_location
    assert @witcher.location.match(/(\w+\.? ?){2,3}/)
  end

  def test_school
    assert @witcher.school.match(/\w+/)
  end

  def test_witcher
    assert @witcher.witcher.match(/(\w+\.? ?){2,3}/)
  end

end
