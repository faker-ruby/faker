require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerWorkout < Test::Unit::TestCase
  def setup
     @workout = Faker::Workout
     @cardio  = @workout.cardio_array
     @sample = @workout.cardio
  end

  def test_cardio_array
    @cardio.each do |element|
       assert !element.nil?
       assert element != ""
       assert element.match(/\w* for [1..3]0 minutes/)
    end
  end

  def test_cardio_sample
    assert @sample.match(/\w* for [1..3]0 minutes/)
  end

  def test_exercise
    assert @workout.exercise.match(/\w+/)
  end
end
