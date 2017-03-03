require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCoffee < Test::Unit::TestCase
  def setup
    @tester = Faker::Coffee
    @intensifiers = Faker::Base.fetch_all('coffee.intensifier')
    @body_descriptors = Faker::Base.fetch_all('coffee.body')
    @flavor_descriptors = Faker::Base.fetch_all('coffee.descriptor')
    @varieties = Faker::Base.fetch_all('coffee.variety')
    blend_name_words_one = Faker::Base.fetch_all('coffee.name_1')
    blend_name_words_two = Faker::Base.fetch_all('coffee.name_2')
    @name_words = blend_name_words_one.concat(blend_name_words_two)
  end

  def test_origin
    # test for valid string formatting, capture output matched values
    my_origin = @tester.origin
    p my_origin
    assert origin = my_origin.match(/\A(?<region>([[:alnum:]]+'?,?\s?){1,5}), (?<country>([[:alnum:]]+\s?){1,5})\z/)
    # p search_format(origin[2]).class
    # test for valid region, country pair
    # country needs to be sanitized for snake case/ lower case
    country = origin[2]
    search_format_country = origin[2].split.length > 1 ? origin[2].downcase.split.join('_') : origin[2].downcase
    countries = Faker::Base.fetch_all('coffee.country')
    regions = Faker::Base.fetch_all("coffee.regions.#{search_format_country}")
    assert countries.include?(country)
    assert regions.include?(origin[1])
  end

  def test_notes
    # test for valid string formatting TODO: fix this regex!!!!!
    assert notes = @tester.notes
                   .match(/\A(?<intensifier>[\s\w-]+), (?<body>[\s\w-]+), (?<f1>[!\s\w-]+), (?<f2>[!\s\w-]+), (?<f3>[!\s\w-]+)\z/)
    # test for valid structure, ie intensifier/body/descriptor * 3
    # intensifiers.include? intensifier or something like that...
    # grab each note from capture group to test against
    assert @intensifiers.include?(notes[:intensifier])
    assert @body_descriptors.include?(notes[:body])
    [notes[:f1], notes[:f2], notes[:f3]].each do |flavor|
      assert @flavor_descriptors.include?(flavor)
    end
  end

  def test_variety
    assert @tester.variety.match(/\w+\.?/)
    assert @varieties.include?(@tester.variety)
  end

  def test_blend_name
    assert blend = @tester.blend_name.match(/(([[:alnum:]]+(-?\w*)*('?\w+)?) ?){1,}/)
    p 'match:', blend
    p 'name: ', blend[0]
    p 'words:', @name_words
    blend[0].split.each do |word|
      assert @name_words.include?(word)
    end
  end
end
