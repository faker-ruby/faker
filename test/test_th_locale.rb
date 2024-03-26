# frozen_string_literal: true

require_relative 'test_helper'

class TestThLocale < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'th'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_th_name_methods
    assert_kind_of String, Faker::Name.first_name
    assert_kind_of String, Faker::Name.last_name
  end
end
