# frozen_string_literal: true

require_relative 'test_helper'

module Faker
  class TestFake
    def self.a_class_method
      'called a_class_method'
    end
  end
end

class TestFaker < Test::Unit::TestCase
  def setup; end

  def test_numerify
    100.times do
      assert Faker::Base.numerify('###').match(/[1-9]\d{2}/)
    end
  end

  def test_letterify
    assert Faker::Base.letterify('???').match(/[A-Z]{3}/)
  end

  def test_regexify
    {
      'uk post code' => /^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$/,
      'us phone' => /^(1-?)[2-8][0-1][0-9]-\d{3}-\d{4}$/
    }.each do |label, re|
      10.times do
        assert re.match(result = Faker::Base.regexify(re)), "#{result} is not a match for #{label}"
      end
    end
  end

  def test_deterministic_numerify
    Faker::Config.random = Random.new(42)
    v = Faker::Base.numerify('###')

    Faker::Config.random = Random.new(42)
    assert v == Faker::Base.numerify('###')
  end

  def test_deterministic_regexify
    re = /^(1-?)[2-8][0-1][0-9]-\d{3}-\d{4}$/
    Faker::Config.random = Random.new(42)
    v = Faker::Base.regexify(re)

    Faker::Config.random = Random.new(42)
    assert v == Faker::Base.regexify(re)
  end

  def test_deterministic_letterify
    Faker::Config.random = Random.new(42)
    v = Faker::Base.letterify('???')

    Faker::Config.random = Random.new(42)
    assert v == Faker::Base.letterify('???')
  end

  def test_deterministic_fetch
    Faker::Config.random = Random.new(42)
    v = Faker::Base.fetch('name.first_name')

    Faker::Config.random = Random.new(42)
    assert v == Faker::Base.fetch('name.first_name')
  end

  def test_deterministic_rand_in_range
    Faker::Config.random = Random.new(42)
    v = Faker::Base.rand_in_range(0, 1000)

    Faker::Config.random = Random.new(42)
    assert v == Faker::Base.rand_in_range(0, 1000)
  end

  def test_parse
    data = {
      faker: {
        simple: { lookup: 'a value' },
        class: {
          call_method: "\#{TestFake.a_class_method}",
          use_translation: "\#{TestFake.use_i18n}"
        },
        test_fake: { use_i18n: 'used i18n for translation' }
      }
    }
    I18n.backend.store_translations(Faker::Config.locale, data)

    assert_equal(Faker::Base.parse('simple.lookup'), 'a value')
    assert_equal(Faker::Base.parse('class.call_method'), 'called a_class_method')
    assert_equal(Faker::Base.parse('class.use_translation'), 'used i18n for translation')
  end

  def test_rand_for_nil
    assert_nothing_raised ArgumentError do
      Faker::Base.rand(nil)
    end
    assert_nothing_raised ArgumentError do
      Faker::Base.rand
    end
  end

  def test_rand_for_zero
    assert_nothing_raised ArgumentError do
      Faker::Base.rand(0)
    end
    assert_equal 0, Faker::Base.rand(0)
  end

  def test_rand_for_range
    assert_nothing_raised ArgumentError do
      Faker::Base.rand(0..6)
    end
    assert_includes 0..6, Faker::Base.rand(0..6)
  end

  def test_unique
    unique_numbers = Array.new(8) do
      Faker::Base.unique.numerify('#')
    end

    assert_equal(unique_numbers.uniq, unique_numbers)
  end

  def test_submodule_resolution
    assert_equal(Faker.test_fake, Faker::TestFake)
  end
end
