# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFile < Test::Unit::TestCase
  def setup
    @tester = Faker::File
  end

  def test_extension
    assert_match(/(flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|json|txt|mp4|avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|pages|numbers|key|pdf)/, @tester.extension)
  end

  def test_mime_type_format
    assert_match %r{(.*)/(.*)+}, @tester.mime_type
  end

  def test_mime_type_format_with_media_type
    media_type = Faker::Base.translate('faker.file.mime_type').keys.sample
    assert_match %r{#{media_type}/(.*)+}, @tester.mime_type(media_type: media_type)
  end

  def test_file_name
    assert_match %r{^([a-z\-_.]+)(\\|/)([a-z\-_]+)\.([a-z]+)$}, @tester
      .file_name
  end

  def test_dir
    assert_match %r{^(([a-z\-_.]+)(\\|/)){2}([a-z\-_.]+)$}, @tester.dir
  end

  def test_dir_with_args
    assert_match %r{^\\root(\\([a-z\-_.]+)){2}$}, @tester
      .dir(segment_count: 2, root: '\\root\\', directory_separator: '\\')
  end
end
