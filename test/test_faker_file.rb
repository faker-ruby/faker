require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerFile < Test::Unit::TestCase

  def setup
    @tester = Faker::File
  end

  def test_extension
    assert @tester.extension.match(/(flac|mp3|wav|bmp|gif|jpeg|jpg|png|tiff|css|csv|html|js|json|txt|mp4|avi|mov|webm|doc|docx|xls|xlsx|ppt|pptx|odt|ods|odp|pages|numbers|key|pdf)/)
  end

  def test_mime_type_format
    assert @tester.mime_type.match(/(.*)\/(.*)+/)
  end

  def test_file_name
    assert @tester.file_name.match(/([a-z\-_]*)(\\|\/)([a-z\-_]*)\.([a-z]{2,4})/)
  end

end
