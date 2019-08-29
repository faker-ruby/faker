# frozen_string_literal: true

module Faker
  class Name < Base
    flexible :name

    class << self
      def name
        parse('name.name')
      end

      def name_with_middle
        parse('name.name_with_middle')
      end

      def first_name
        if parse('name.first_name').empty?
          fetch('name.first_name')
        else
          parse('name.first_name')
        end
      end

      def male_first_name
        fetch('name.male_first_name')
      end
      alias first_name_men male_first_name
      alias masculine_name male_first_name

      def female_first_name
        fetch('name.female_first_name')
      end
      alias first_name_women female_first_name
      alias feminine_name female_first_name

      def last_name
        parse('name.last_name')
      end
      alias middle_name last_name

      def prefix
        fetch('name.prefix')
      end

      def suffix
        fetch('name.suffix')
      end

      def initials(legacy_number = NOT_GIVEN, number: 3)
        if legacy_number != NOT_GIVEN
          warn_with_uplevel 'Passing `number` with the 1st argument of `Name.initials` is deprecated. Use keyword argument like `Name.initials(number: ...)` instead.', uplevel: 1
          number = legacy_number
        end

        (0...number).map { rand(65..90).chr }.join
      end
    end
  end
end
