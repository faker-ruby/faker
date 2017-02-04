require File.dirname(__FILE__) + '/test_helper.rb'

class TestFakerLoremFlickr < Test::Unit::TestCase

  def setup
    @tester = Faker::LoremFlickr
  end

  def test_image
    assert @tester.image == 'http://loremflickr.com/300/300'
  end

  def test_image_with_size
    assert @tester.image('50x60') == 'http://loremflickr.com/50/60'
  end

  def test_image_with_is_gray
    assert @tester.image('50x60', true) == 'http://loremflickr.com/g/50/60'
  end

  def test_image_with_single_search_term
    assert @tester.image('50x60', false, ['faker']) == 'http://loremflickr.com/50/60/faker'
  end

  def test_image_with_multiple_search_terms
    assert @tester.image('50x60', false, ['dog', 'cat']) == 'http://loremflickr.com/50/60/dog,cat'
  end

end
