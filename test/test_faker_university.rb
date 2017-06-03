require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerUniversity < Test::Unit::TestCase
  def setup
    @tester = Faker::University
    @alphabet = Faker::University.greek_alphabet
  end

  def test_prefix
    assert @tester.prefix.match(/\w+\.?/)
  end

  def test_suffix
    assert @tester.suffix.match(/\w+\.?/)
  end

  def test_name
    assert @tester.name.match(/\w+\.?/)
  end

  def test_greek_alphabet_has_24_characters
    assert @alphabet.count == 24
  end

  def test_greek_organization
    assert @tester.greek_organization.match(/\w+\.?/)
    assert @tester.greek_organization.length == 3
  end

  def test_greek_organization_is_assembled_from_greek_alphabet
    test_organization = @tester.greek_organization
    test_organization.each_char do |letter|
      assert @alphabet.include?(letter)
    end
  end



end
