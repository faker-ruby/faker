require File.dirname(__FILE__) + '/test_helper.rb'
require 'rubygems'
require 'fastimage'

class TestFakerCity < Test::Unit::TestCase

  def test_can_load_image
    image = Faker::Flickr.image

    assert_not_nil image
    file_type = FastImage.type(image)
    assert [:jpeg, :png].include? file_type
  end

  def test_can_load_image_with_tag
    image = Faker::Flickr.image("winter")

    assert_not_nil image
    file_type = FastImage.type(image)
    assert [:jpeg, :png].include? file_type
  end

end
