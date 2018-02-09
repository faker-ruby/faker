require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerIdNumber < Test::Unit::TestCase

  def setup
    @tester = Faker::IDNumber
  end

  def test_valid_ssn
    sample = @tester.valid
    assert sample.length == 11
    assert sample[3] == "-"
    assert sample[6] == "-"
    assert sample[0..2].split().map{:to_i}.all?{:is_digit?}
    assert sample[4..5].split().map{:to_i}.all?{:is_digit?}
    assert sample[7..9].split().map{:to_i}.all?{:is_digit?}
  end

  def test_invalid_ssn
    sample = @tester.invalid
    assert sample.length == 11
    assert sample[3] == "-"
    assert sample[6] == "-"
    assert sample[0..2].split().map{:to_i}.all?{:is_digit?}
    assert sample[4..5].split().map{:to_i}.all?{:is_digit?}
    assert sample[7..9].split().map{:to_i}.all?{:is_digit?}
  end

end
