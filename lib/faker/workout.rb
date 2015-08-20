module Faker
  class Workout < Base
    flexible :workout
    
    class << self
      def random_cardio 
        cardio.sample
      end
      
      def exercise 
        fetch('workout.exercise') 
      end
                    
      def cardio 
        [ "#{rand(3)+1}0 minutes on the elliptical",
          "#{rand(3)+1}0 minutes on the treadmill",
          "Jog for #{rand(3)+1}0 minutes"
        ]
      end
    end
  end
end
