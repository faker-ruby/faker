require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerSemanticVersioning < Test::Unit::TestCase
  def setup
    @tester = Faker::SemanticVersion
  end

  def test_basic_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version().split(".")
      assert test_sem_vers[0].match(/[0-9]{1}/)
      assert test_sem_vers[1].match(/[0-9]{1}/)
      assert test_sem_vers[2].match(/[1-9]{1}/)
    end
  end

  def test_major_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version(1000, 9999).split(".")
      assert test_sem_vers[0].match(/[0-9]{4}/)
      assert test_sem_vers[1].match(/[0-9]{1}/)
      assert test_sem_vers[2].match(/[1-9]{1}/)
    end
  end

  def test_minor_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version(0, 9, 1000, 9999).split(".")
      assert test_sem_vers[0].match(/[0-9]{1}/)
      assert test_sem_vers[1].match(/[0-9]{4}/)
      assert test_sem_vers[2].match(/[1-9]{1}/)
    end
  end

  def test_patch_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version(0, 9, 0, 9, 1000, 9999).split(".")
      assert test_sem_vers[0].match(/[0-9]{1}/)
      assert test_sem_vers[1].match(/[0-9]{1}/)
      assert test_sem_vers[2].match(/[0-9]{4}/)
    end
  end

  def test_all_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version(from_major=1000, to_major=9999, from_minor=1000, to_minor=9999, from_patch=1000, to_patch=9999).split(".")
      assert test_sem_vers[0].match(/[0-9]{4}/)
      assert test_sem_vers[1].match(/[0-9]{4}/)
      assert test_sem_vers[2].match(/[0-9]{4}/)
    end
  end

end
