require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSource < Test::Unit::TestCase
  def setup
    @tester = Faker::Source
  end

  def test_hello_world
    assert_instance_of String, @tester.hello_world
  end

  def test_print
    assert_instance_of String, @tester.print
  end

  def test_print_javascript
    assert_equal "console.log('some string');", @tester.print(lang: :javascript)
  end

  def test_print_another_string
    assert_equal "print 'another string'", @tester.print(str: 'another string')
  end

  def test_print_invalid_lang
    assert_raise(I18n::MissingTranslationData) { @tester.print(lang: :js) }
  end

  def test_print_1_to_10
    assert_instance_of String, @tester.print_1_to_10
  end

  def test_print_1_to_10_javascript
    assert_match 'console.log(i);', @tester.print_1_to_10(:javascript)
  end

  def test_print_1_to_10_matches
    assert_match 'print i', @tester.print_1_to_10
  end
end
