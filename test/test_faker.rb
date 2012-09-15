require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFaker < Test::Unit::TestCase

  def setup
  end

  def teardown
    Faker::Config.locale = nil
  end

  def test_send_to_locale_class
    Faker::Config.locale = :pl
    Faker::Locale::Pl::Base.expects :vat
    Faker::Base.send_to_locale_class(:vat)
  end

  def test_locale_class
    locales = { "en" => "Faker::Locale::En::Base", "en-US" => "Faker::Locale::En::Us" }
    locales.each do |k, v|
      Faker::Config.locale = k.to_sym
      assert_equal v, Faker::Base.locale_class_name
    end
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
      'us phone' => /^(1-?)[1-8][0-1][0-9]-\d{3}-\d{4}$/
    }.each do |label, re|
      10.times do
        assert re.match(result = Faker::Base.regexify(re)), "#{result} is not a match for #{label}"
      end
    end
  end

end
