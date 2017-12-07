require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')
require 'minitest/mock'

class TestFakerSemanticVersioning < Test::Unit::TestCase
  def setup
    @tester = Faker::SemanticVersion
  end

  def test_basic_semantic_version
    10.times do |digits|
      test_sem_vers = @tester.semantic_version().split(".")
      print("\n::: test_sem_vers: #{test_sem_vers}")
      assert test_sem_vers[0].match(/[0-9]{1}/)
      assert test_sem_vers[1].match(/[0-9]{1}/)
      assert test_sem_vers[2].match(/[1-9]{1}/)
    end

  end


end
