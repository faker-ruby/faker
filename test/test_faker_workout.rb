require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerWorkout < Test::Unit::TestCase      
  def setup
     @workout = Faker::Workout
     @cardio  = @workout.cardio
  end

  def test_cardio
    assert @cardio.size == 3    
    @cardio.each do |element|
       assert !element.nil?
       assert element != ""
    end        
  end  

  def test_exercise
    assert @workout.exercise.match(/\w+/)
  end

end
