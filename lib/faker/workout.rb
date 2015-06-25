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
        [ "#{rand(1..3)}0 minutes on the elliptical",
          "#{rand(1..3)}0 minutes on the treadmill",
          "Jog for #{rand(1..3)}0 minutes"
        ]
      end
    end

  end
end
