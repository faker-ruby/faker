require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVerb < Test::Unit::TestCase
  def setup
    @tester = Faker::Verb
  end

  def test_base
    assert @tester.base.match(/\w+/)
  end

  def test_past
    assert @tester.past.match(/\w+/)
  end

  def test_past_participle
    assert @tester.past_participle.match(/\w+/)
  end

  def test_simple_present
    assert @tester.simple_present.match(/\w+/)
  end

  def test_ing_form
    assert @tester.ing_form.match(/\w+/)
  end
end
