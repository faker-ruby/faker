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

  def test_image_with_search_terms_and_match_all
    assert @tester.image('50x60', false, ['dog', 'cat'], true) == 'http://loremflickr.com/50/60/dog,cat/all'
  end

  def test_pixelated_image_without_search_terms
    assert_raise ArgumentError do
      @tester.pixelated_image('50x60')
    end
  end

  def test_pixelated_image_with_single_search_term
    assert @tester.pixelated_image('50x60', ['faker']) == 'http://loremflickr.com/p/50/60/faker'
  end

  def test_pixelated_image_with_multiple_search_terms
    assert @tester.pixelated_image('50x60', ['dog', 'cat']) == 'http://loremflickr.com/p/50/60/dog,cat'
  end

  def test_pixelated_image_with_search_terms_and_match_all
    assert @tester.pixelated_image('50x60', ['dog', 'cat'], true) == 'http://loremflickr.com/p/50/60/dog,cat/all'
  end

  def test_colorized_image_without_search_terms
    assert_raise ArgumentError do
      @tester.colorized_image('50x60', 'red')
    end
  end

  def test_colorized_image_with_unsupported_colorization
    assert_raise ArgumentError do
      @tester.colorized_image('50x60', 'yellow')
    end
  end

  def test_colorized_image_with_single_search_term
    assert @tester.colorized_image('50x60', 'red', ['faker']) == 'http://loremflickr.com/red/50/60/faker'
  end

  def test_colorized_image_with_multiple_search_terms
    assert @tester.colorized_image('50x60', 'red', ['dog', 'cat']) == 'http://loremflickr.com/red/50/60/dog,cat'
  end

  def test_colorized_image_with_search_terms_and_match_all
    assert @tester.colorized_image('50x60', 'red', ['dog', 'cat'], true) == 'http://loremflickr.com/red/50/60/dog,cat/all'
  end

end
