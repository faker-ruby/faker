require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerSiliconValley < Test::Unit::TestCase
  def setup
    @characters = Faker::SiliconValley.characters
    @companies = Faker::SiliconValley.companies
    @quotes = Faker::SiliconValley.quotes
  end

  def test_strings
    assert @characters.size == 16
    @characters.each do |character|
      refute character.to_s.empty?
    end

    assert @companies.size == 5
    @companies.each do |company|
      refute company.to_s.empty?
    end

    assert @quotes.size == 10
    @quotes.each do |quote|
      refute quote.to_s.empty?
    end
  end

  def test_character
    assert Faker::SiliconValley.character.match(/\w+/)
  end

  def test_company
    assert Faker::SiliconValley.company.match(/\w+/)
  end

  def test_quote
    assert Faker::SiliconValley.quote.match(/\w+/)
  end
end
