# frozen_string_literal: true

require_relative 'test_helper'

class TestViLocale < Test::Unit::TestCase
  def setup
    @previous_locale = Faker::Config.locale
    Faker::Config.locale = 'vi'
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_vi_name_methods
    assert Faker::Name.name_with_middle.is_a? String
  end
end
