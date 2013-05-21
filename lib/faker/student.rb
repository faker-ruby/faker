# encoding: utf-8
module Faker
  class Student < Base
    class << self
      def school_name
        fetch('student.school_name') + " University"
      end

      #student ID#
      def id
        numerify(fetch('student.id'))
      end

      #student GPA
      def gpa (low, high, precision)

        #low = sprintf ()

        low = low.to_f if precision > 0


        (Random.rand low..high).round(precision).to_s 
      end

      def major
        fetch('student.major')
      end
    end
  end
end