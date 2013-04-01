# encoding: utf-8
module Faker
  class Student < Base
    class << self
      def school_name
        fetch('student.school_name') + " University"
      end

      #student ID#
      def id
        (Random.rand 0..999999999).to_s
      end

      #student GPA
      def gpa
        (Random.rand 1.00..4.00).round(2).to_s
      end

      def major
        fetch('student.major')
      end
    end
  end
end