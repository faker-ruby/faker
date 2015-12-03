module Faker
  class Educator < Base
    flexible :educator

    class << self
      def university
        "#{fetch('educator.name')} #{fetch('educator.tertiary.type')}"
      end

      def course
        "#{fetch('educator.tertiary.course.type')} #{fetch('educator.tertiary.course.subject')}"
      end

      def secondary_school
        "#{fetch('educator.name')} #{fetch('educator.secondary')}"
      end

      def campus
        "#{fetch('educator.name')} Campus"
      end
    end
  end
end
