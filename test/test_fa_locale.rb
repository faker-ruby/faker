# frozen_string_literal: true

require_relative 'test_helper'

class TestFaLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'fa'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_fa_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
    assert_kind_of String, Faker::Name.prefix
    assert_kind_of String, Faker::Name.name_with_middle
  end
end
