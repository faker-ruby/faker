# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCoffee < Test::Unit::TestCase
  def setup
    @tester = Faker::Coffee
    @countries = Faker::Base.fetch_all('coffee.country')
    @intensifiers = Faker::Base.fetch_all('coffee.intensifier')
    @body_descriptors = Faker::Base.fetch_all('coffee.body')
    @flavor_descriptors = Faker::Base.fetch_all('coffee.descriptor')
    @varieties = Faker::Base.fetch_all('coffee.variety')
    blend_name_words_one = Faker::Base.fetch_all('coffee.name_1')
    blend_name_words_two = Faker::Base.fetch_all('coffee.name_2')
    @name_words = blend_name_words_one.dup.concat(blend_name_words_two)
  end

  def test_origin
    assert origin = @tester.origin.match(/\A(?<region>(?:[[:alnum:]]+'?-?.?,?\s?){1,5}), (?<country>(?:[[:alnum:]]+\s?){1,5})\z/)

    region = origin[:region]
    country = origin[:country]
    search_format_country = country.split.length > 1 ? country.downcase.split.join('_') : country.downcase
    regions = Faker::Base.fetch_all("coffee.regions.#{search_format_country}")

    assert_includes @countries, country
    assert_includes regions, region
  end

  def test_notes
    assert notes = @tester.notes
                          .match(/\A(?<intensifier>[\s\w-]+), (?<body>[\s\w-]+), (?<f1>[!\s\w-]+), (?<f2>[!\s\w-]+), (?<f3>[!\s\w-]+)\z/)

    assert_includes @intensifiers, notes[:intensifier]
    assert_includes @body_descriptors, notes[:body]

    [notes[:f1], notes[:f2], notes[:f3]].each do |flavor|
      assert_includes @flavor_descriptors, flavor
    end
  end

  def test_variety
    assert_match(/\w+\.?/, @tester.variety)

    assert_includes @varieties, @tester.variety
  end

  def test_blend_name
    assert blend = @tester.blend_name.match(/(([[:alnum:]]+(-?\w*)*('?\w+)?) ?){1,}/)

    blend[0].split.each do |word|
      assert_includes @name_words, word
    end
  end
end
