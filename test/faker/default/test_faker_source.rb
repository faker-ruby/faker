# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSource < Test::Unit::TestCase
  def setup
    @tester = Faker::Source
  end

  def test_hello_world_instance
    assert_instance_of String, @tester.hello_world
  end

  def test_hello_world
    assert_match "'Hello World!'", @tester.hello_world
  end

  def test_print_instance
    assert_instance_of String, @tester.print
  end

  def test_print
    assert_match "'some string'", @tester.print
  end

  def test_print_another_string
    assert_match "'another string'", @tester.print(str: 'another string')
  end

  def test_print_invalid_lang
    assert_raise(I18n::MissingTranslationData) { @tester.print(lang: :js) }
  end

  def test_print_1_to_10_instance
    assert_instance_of String, @tester.print_1_to_10
  end

  def test_print_1_to_10_javascript
    assert_match 'console.log(i);', @tester.print_1_to_10(lang: :javascript)
  end
end
