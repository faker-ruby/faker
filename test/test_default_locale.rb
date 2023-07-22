# frozen_string_literal: true

require_relative 'test_helper'

class TestDefaultLocale < Test::Unit::TestCase
  def test_setting_default_locale
    # if locale is not set, fallback is :en
    assert_equal :en, Faker::Config.locale

    # locale can be updated initially
    # and it becomes the default value
    # for new threads
    Faker::Config.default_locale = :pt

    assert_equal :pt, Faker::Config.locale

    t1 = Thread.new do
      # child thread has initial locale equal to
      # latest locale set on main thread
      # instead of the fallback value
      assert_equal :pt, Faker::Config.locale

      # child thread can set its own locale
      Faker::Config.locale = :es

      assert_equal :es, Faker::Config.locale
    end

    t1.join

    # child thread won't change locale of other threads
    assert_equal :pt, Faker::Config.locale

    t2 = Thread.new do
      # initial default locale is copied over to new thread
      assert_equal :pt, Faker::Config.locale

      Faker::Config.locale = :it

      assert_equal :it, Faker::Config.locale
    end

    t2.join

    assert_equal :pt, Faker::Config.locale

    # setting this to reset the default locale for all tests
    Faker::Config.default_locale = nil

    assert_equal :en, Faker::Config.locale
  end

  def test_setting_default_locale_on_child_thread
    # if locale is not set, fallback is :en
    assert_equal :en, Faker::Config.locale

    # locale can be updated initially
    # and it becomes the default value
    # for new threads
    Faker::Config.default_locale = :pt

    assert_equal :pt, Faker::Config.locale

    t1 = Thread.new do
      # child thread has initial locale equal to
      # latest locale set on main thread
      # instead of the fallback value
      assert_equal :pt, Faker::Config.locale

      # child thread can set the default locale
      Faker::Config.default_locale = :es

      assert_equal :es, Faker::Config.locale
    end

    t1.join

    # all threads now will have the same default
    assert_equal :es, Faker::Config.locale

    t2 = Thread.new do
      # initial default locale is copied over to new thread
      assert_equal :es, Faker::Config.locale

      Faker::Config.locale = :it

      assert_equal :it, Faker::Config.locale
    end

    t2.join

    assert_equal :es, Faker::Config.locale

    # setting this to reset the default locale for all tests
    Faker::Config.default_locale = nil

    assert_equal :en, Faker::Config.locale
  end
end
