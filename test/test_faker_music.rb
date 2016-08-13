require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMusic < Test::Unit::TestCase
  def setup
    @tester = Faker::Music
  end

  def test_keys
    assert @tester.keys.size == 7
    @tester.keys.each do |key|
       assert !key.nil?
       assert key != ""
    end
  end

  def test_key_variants
    assert @tester.key_variants.size == 3
    @tester.key_variants.each do |key_variant|
       assert !key_variant.nil?
    end
  end

  def test_key
    assert @tester.name.match(/([A-Z])+(b|#){0,1}/)
  end

  def test_instrument
    assert @tester.instrument.match(/\w+/)
  end
end
