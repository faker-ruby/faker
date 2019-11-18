# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerFilter < Test::Unit::TestCase
  def test_filters
    filter_proc = proc { |letter| letter == 'A' }
    generator = Faker::Filter.new(Faker::Base, 10_000, &filter_proc)

    assert_equal('A', generator.letterify('?'))
  end

  def test_respond_to_missing
    stubbed_generator = Struct.new(:faker_address).new

    generator = Faker::Filter.new(stubbed_generator, 3)

    assert_equal(true, generator.send(:respond_to_missing?, 'faker_address'))
    assert_equal(false, generator.send(:respond_to_missing?, 'address'))
  end

  def test_returns_error_when_retries_exceeded
    filter_proc = proc { false }
    generator = Faker::Filter.new(Faker::Base, 1, &filter_proc)

    assert_raises Faker::Filter::RetryLimitExceeded do
      generator.letterify('?')
    end
  end

  def test_includes_field_name_in_error
    filter_proc = proc { false }
    generator = Faker::Filter.new(Faker::Base, 1, &filter_proc)

    assert_raise_message 'Retry limit exceeded for letterify' do
      generator.letterify('?')
    end
  end
end
