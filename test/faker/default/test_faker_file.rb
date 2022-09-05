# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFile < Test::Unit::TestCase
  def setup
    @tester = Faker::File
  end

  def test_extension
    assert @tester.extension.match(/(flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|json|txt|mp4|avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|pages|numbers|key|pdf)/)
  end

  def test_mime_type_format
    assert @tester.mime_type.match(%r{(.*)/(.*)+})
  end

  def test_mime_type_format_with_media_type
    media_type = Faker::Base.translate('faker.file.mime_type').keys.sample
    assert @tester.mime_type(media_type: media_type).match(%r{#{media_type}/(.*)+})
  end

  def test_file_name
    assert @tester
      .file_name
      .match(%r{^([a-z\-_.]+)(\\|/)([a-z\-_]+)\.([a-z]+)$})
  end

  def test_dir
    assert @tester.dir.match(%r{^(([a-z\-_.]+)(\\|/)){2}([a-z\-_.]+)$})
  end

  def test_dir_with_args
    assert @tester
      .dir(segment_count: 2, root: '\\root\\', directory_separator: '\\')
      .match(%r{^\\root(\\([a-z\-_.]+)){2}$})
  end
end
