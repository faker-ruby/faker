# frozen_string_literal: true

module Faker
  class Educator < Base
    flexible :educator

    class << self
      def university
        parse('educator.university')
      end

      def degree
        parse('educator.degree')
      end

      alias course degree

      def subject
        fetch('educator.subject')
      end

      def course_name
        numerify(parse('educator.course_name'))
      end

      def secondary_school
        parse('educator.secondary_school')
      end

      def campus
        parse('educator.campus')
      end
    end
  end
end
