# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerApp < Test::Unit::TestCase
  def setup
    @tester = Faker::App
  end

  def test_name
    assert_match(/(\w+\.? ?){2,3}/, @tester.author)
  end

  def test_basic_semantic_version
    10.times do |_digits|
      test_sem_vers = @tester.semantic_version.split('.')
      assert_match(/[0-9]{1}/, test_sem_vers[0])
      assert_match(/[0-9]{1}/, test_sem_vers[1])
      assert_match(/[1-9]{1}/, test_sem_vers[2])
    end
  end

  def test_major_semantic_version
    10.times do |_digits|
      test_sem_vers = @tester.semantic_version(major: (1000..9999)).split('.')
      assert_match(/[0-9]{4}/, test_sem_vers[0])
      assert_match(/[0-9]{1}/, test_sem_vers[1])
      assert_match(/[1-9]{1}/, test_sem_vers[2])
    end
  end

  def test_minor_semantic_version
    10.times do |_digits|
      test_sem_vers = @tester.semantic_version(minor: (1000..9999)).split('.')
      assert_match(/[0-9]{1}/, test_sem_vers[0])
      assert_match(/[0-9]{4}/, test_sem_vers[1])
      assert_match(/[1-9]{1}/, test_sem_vers[2])
    end
  end

  def test_patch_semantic_version
    10.times do |_digits|
      test_sem_vers = @tester.semantic_version(patch: (1000..9999)).split('.')
      assert_match(/[0-9]{1}/, test_sem_vers[0])
      assert_match(/[0-9]{1}/, test_sem_vers[1])
      assert_match(/[0-9]{4}/, test_sem_vers[2])
    end
  end

  def test_all_semantic_version
    10.times do |_digits|
      test_sem_vers = @tester.semantic_version(major: (1000..9999), minor: (1000..9999), patch: (1000..9999)).split('.')
      assert_match(/[0-9]{4}/, test_sem_vers[0])
      assert_match(/[0-9]{4}/, test_sem_vers[1])
      assert_match(/[0-9]{4}/, test_sem_vers[2])
    end
  end

  def test_specific_major_version
    assert_match(/42\.[0-9]\.[0-9]/, @tester.semantic_version(major: 42))
  end
end
