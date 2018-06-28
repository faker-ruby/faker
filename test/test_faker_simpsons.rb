# frozen_string_literal: true

require_relative 'test_helper'

class TestFakerSimpsons < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_characters
    10.times { assert Faker::Simpsons.character.match(/[\w]+/) }
  end

  def test_locations
    10.times { assert Faker::Simpsons.location.match(/[\w]+/) }
  end

  def test_quote
    10.times { assert Faker::Simpsons.quote.match(/[\w]+/) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'
      assert Faker::Simpsons.character.is_a? String
      assert Faker::Simpsons.location .is_a? String
      assert Faker::Simpsons.quote    .is_a? String
    end
  end
end
