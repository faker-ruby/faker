# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerBiblesKingJames < Test::Unit::TestCase
  def setup
    @tester = Faker::Bibles::KingJames
  end

  def test_book
    assert @tester::BOOKS.include? @tester.book
  end

  def test_books_in_locale
    @tester::BOOKS.each do |book|
      assert @tester.fetch("king_james.#{book}").match(/\w+/)
    end
  end

  def test_verse_with_no_arguments
    assert @tester.verse.match(/\w+/)
  end

  def test_verse_without_prefix
    refute @tester.verse(prefix: false).match(@tester::PREFIX_PATTERN)
  end

  def test_verse_without_emphasis
    refute @tester.verse(emphasis: false).include?('*')
  end

  def test_verse_without_prefix_without_emphasis
    result = @tester.verse(prefix: false, emphasis: false)
    refute result.match(@tester::PREFIX_PATTERN)
    refute result.include?('*')
  end

  Faker::Bibles::KingJames::BOOKS.each do |book|
    define_method(:"test_#{book}_method_with_default_arguments") { @tester.method(book) }
  end
end
