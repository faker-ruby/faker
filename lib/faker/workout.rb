module Faker
  class Workout < Base
    flexible :workout

    class << self

      def cardio
        cardio_array.sample
      end

      def exercise
        fetch('workout.exercise')
      end

      def cardio_array
        [
          "Skip for #{rand(3)+1}0 minutes",
          "Elliptical for #{rand(3)+1}0 minutes",
          "Jog for #{rand(3)+1}0 minutes"
        ]
      end
    end
  end
end
