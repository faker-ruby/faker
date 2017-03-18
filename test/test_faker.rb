require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFaker < Test::Unit::TestCase

  def setup
  end

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
  
  def test_unique
    unique_numbers = 8.times.map do
      Faker::Base.unique.numerify('#')
    end

    assert_equal(unique_numbers.uniq, unique_numbers)
  end

end
