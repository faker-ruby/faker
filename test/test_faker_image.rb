class TestFakerImage < Test::Unit::TestCase
  def setup
    @tester = Faker::Image
  end

  def test_default
    assert @tester.image_url == "http://lorempixel.com/400/200/abstract"
  end

  def test_image_size
    size = "300x400"
    assert_equal "http://lorempixel.com/300/400/abstract", @tester.image_url(size: size)
  end

  def test_image_random
    assert_equal "http://lorempixel.com/400/200", @tester.image_url(category: "random")
  end

  def test_image_category
    category = "sports"
    assert_equal "http://lorempixel.com/400/200/sports", @tester.image_url(category: category)
  end

  def test_image_size_and_category
    assert_equal "http://lorempixel.com/300/500/cats", @tester.image_url(category: "cats", size: "300x500")
  end

  def test_image_number
    assert_equal "http://lorempixel.com/400/200/abstract/3", @tester.image_url(number: 3)
  end

  def test_image_size_category_and_number
    assert_equal "http://lorempixel.com/640/480/fashion/3", @tester.image_url(number: 3, category: "fashion", size: "640x480")
  end

  def test_image_wrong_size
    assert_raise ArgumentError do
      @tester.image_url(size: "300x500z")
    end
  end
end
