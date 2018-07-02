require_relative 'test_helper'

class TestFakerDemographic < Test::Unit::TestCase
  def setup
    @tester = Faker::Demographic
  end

  def test_race
    assert @tester.race.match(/\w+/)
  end

  def test_educational_attainment
    assert @tester.educational_attainment.match(/\w+/)
  end

  def test_marital_status
    assert @tester.marital_status.match(/\w+/)
  end

  def test_demonym
    assert @tester.demonym.match(/\w+/)
  end

  def test_sex
    assert %w[Male Female].include?(@tester.sex)
  end

  def test_height_imperial
    assert @tester.height(:imperial).match(/\w+/)
  end

  def test_height_metric
    assert @tester.height.match(/\w+/)
  end
end
