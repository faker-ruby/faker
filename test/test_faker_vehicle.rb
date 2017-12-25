require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerVehicle < Test::Unit::TestCase
  def setup
    @tester = Faker::Vehicle
    @vin_chars = '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'
    @vin_map = '0123456789X'
    @vin_weights = '8765432X098765432'
  end

  def test_vin
    vin = @tester.vin
    checksum = vin_checksum(vin)

    assert vin.length == 17
    assert vin[8] == checksum
  end

  def test_manufacture
    assert @tester.manufacture.match(/\w+\.?/)
  end

  def test_flexible_key
    flexible_key = @tester.instance_variable_get("@flexible_key")

    assert flexible_key == :vehicle
  end

  private

    def transliterate(character)
      @vin_chars.index(character) % 10
    end

    def calculate_vin_weight(character, i)
      transliterate(character) * @vin_map.index(@vin_weights[i])
    end

    def vin_checksum(vin)
      checksum_index = vin.split('').each_with_index.map(&method(:calculate_vin_weight)).inject(:+)
      @vin_map[checksum_index % 11]
    end

end
