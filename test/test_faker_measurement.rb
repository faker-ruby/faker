require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMeasurement < Test::Unit::TestCase
  def setup
    @tester = Faker::Measurement
  end

  def height
    assert @tester.height.match(/\d\s[a-z]/)
  end

  def height_all
    assert @tester.height_all.match(/\d\s[a-z]/)
  end

  def height_none
    assert @tester.height_none.match(/\d\s[a-z]/)
  end

  def length
    assert @tester.length.match(/\d\s[a-z]/)
  end

  def length_all
    assert @tester.length_all.match(/\d\s[a-z]/)
  end

  def length_none
    assert @tester.length_none.match(/\d\s[a-z]/)
  end

  def volume
    custom_amount_float = @tester.volume(1.5)
    custom_amount_integer = @tester.volume(276)

    assert @tester.volume.match(/\d\s[a-z]/)
    assert custom_amount_float.match(/\d\s[a-z]+[s]\z/)
    assert custom_amount_integer.match(/\d\s[a-z]+[s]\z/)
  end

  def volume_all
    assert @tester.volume_all.match(/\A\D+[^s]\z/)
  end

  def volume_none
    assert @tester.volume_none.match(/\A\D+[^s]\z/)
  end

  def weight
    assert @tester.weight.match(/\d\s[a-z]/)
    assert @tester.weight('all').match(/\d\s[a-z]/)
    assert @tester.weight('none').match(/\d\s[a-z]/)
  end

  def metric_height
    assert @tester.metric_height.match(/\d\s[a-z]/)
  end

  def metric_height_all
    assert @tester.metric_height('all').match(/\d\s[a-z]/)
  end

  def metric_height_none
    assert @tester.metric_height('none').match(/\d\s[a-z]/)
  end

  def metric_length
    assert @tester.metric_length.match(/\d\s[a-z]/)
  end

  def metric_length_all
    assert @tester.metric_length('all').match(/\d\s[a-z]/)
  end

  def metric_length_none
    assert @tester.metric_length('none').match(/\d\s[a-z]/)
  end

  def metric_volume
    assert @tester.metric_volume.match(/\d\s[a-z]/)
  end

  def metric_volume_all
    assert @tester.metric_volume('all').match(/\d\s[a-z]/)
  end

  def metric_volume_none
    assert @tester.metric_volume('none').match(/\d\s[a-z]/)
  end

  def metric_weight
    assert @tester.metric_weight.match(/\d\s[a-z]/)
  end

  def metric_weight_all
    assert @tester.metric_weight.match(/\d\s[a-z]/)
  end

  def metric_weight_none
    assert @tester.metric_weight.match(/\d\s[a-z]/)
  end

  def test_invalid_amount_error
    amount = 'hello world!'

    assert_raise ArgumentError do
      @tester.volume(amount)
    end
  end
end
