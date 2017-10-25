require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSemanticVersion < Test::Unit::TestCase

  def setup
    @tester = Faker::SemanticVersion
  end

  def test_version
    assert @tester.version.match(/(?:\d+\.){2}(?:\d+)/)
  end

  def test_version_with_major
    assert @tester.version(10).match(/(?:10\.)(?:\d+\.)(?:\d+)/)
  end

  def test_version_with_minor
    assert @tester.version(nil, 5).match(/(?:\d+\.)(?:5\.)(?:\d+)/)
  end

  def test_version_with_patch
    assert @tester.version(nil, nil, 2).match(/(?:\d+\.){2}(?:2+)/)
  end

  def test_version_with_meta
    assert @tester.version(nil, nil, nil, true).match(/(?:\d+\.){2}(?:\d+)-[a-z0-9-]*/)
  end

end
