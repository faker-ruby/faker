# frozen_string_literal: true

require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class TestFakerDrWho < Test::Unit::TestCase
  def setup
    Faker::Config.locale = nil
  end

  def test_character
    10.times { assert Faker::DrWho.character.match(/[\w]+/) }
  end

  def test_the_doctor
    10.times { assert Faker::DrWho.the_doctor.match(/[\w]+/) }
  end

  def test_catch_phrase
    10.times { assert Faker::DrWho.catch_phrase.match(/[\w]+/) }
  end

  def test_quote
    10.times { assert Faker::DrWho.quote.match(/[\w]+/) }
  end

  def test_villian
    10.times { assert Faker::DrWho.villian.match(/[\w]+/) }
  end

  def test_specie
    10.times { assert Faker::DrWho.specie.match(/[\w]+/) }
  end

  def test_locales
    [nil, 'en', 'de'].each do |_locale_name|
      Faker::Config.locale = 'de'
      assert Faker::DrWho.character   .is_a? String
      assert Faker::DrWho.the_doctor  .is_a? String
      assert Faker::DrWho.catch_phrase.is_a? String
      assert Faker::DrWho.quote       .is_a? String
      assert Faker::DrWho.villian     .is_a? String
      assert Faker::DrWho.specie      .is_a? String
    end
  end
end
