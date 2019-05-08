# frozen_string_literal: true

module Faker
  class Holiday < Base
    class << self
      def name
        option = rand(2)
        case option
        when 0
          fetch('holiday.holy') % Name.first_name.capitalize
        when 1
          fetch('holiday.nature') % Creature::Animal.name.capitalize
        else
          fetch('holiday.disaster')
        end
      end

      def date
        Date.forward
      end
    end
  end
end
