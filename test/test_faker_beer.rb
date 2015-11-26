require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBeer < Test::Unit::TestCase

  def setup
    @tester = Faker::Beer
  end

  def test_name
    assert @tester.name.match(/(\w+\.? ?){2,3}/)
  end

  def test_style
    assert @tester.style.match(/(\w+\.? ?){2,3}/) # TODO
  end

  def test_hop
    assert @tester.hop.match(/(\w+\.? ?){2,3}/)
  end

  def test_yeast
    assert @tester.yeast.match(/(\w+\.? ?){2,3}/)
  end

  def test_malts
    assert @tester.malts.match(/(\w+\.? ?){2,3}/)
  end

  def test_ibu
    assert @tester.ibu.match(/(\w+\.? ?){2,3}/)
  end

  def test_alcohol
    assert @tester.alcohol.match(/(\w+\.? ?){2,3}/)
  end

  def test_blg
    assert @tester.blg.match(/(\w+\.? ?){2,3}/)
  end

end