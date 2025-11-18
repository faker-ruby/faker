# frozen_string_literal: true

require 'test_helper'
require 'open3'

class TestI18nLoad < Test::Unit::TestCase
  def test_faker_i18n
    # run this code in a subshell to test require faker
    # and proper initialization of i18n.
    code = <<-RUBY
      require 'bundler/inline'

      gemfile do
        source 'https://rubygems.org'
        gem 'minitest'
        gem 'i18n'
      end

      require 'minitest/autorun'
      require 'i18n'

      class TestI18nLoad < Minitest::Test
        def test_faker_i18n
          I18n.available_locales = [:en]
          refute_predicate I18n.backend, :initialized?
          I18n.translate('doesnt matter just triggering a lookup')

          assert_predicate I18n.backend, :initialized?

          assert require File.expand_path('#{File.dirname(__FILE__)}/../lib/faker')

          assert Faker::Name.name
        end
      end
    RUBY

    cmd = %( ruby -e "#{code}" )
    output, status = Open3.capture2e(cmd)

    assert_equal 0, status, output
  end
end
