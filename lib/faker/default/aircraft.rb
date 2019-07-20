# frozen_string_literal: true

module Faker
  class Aircraft < Base
    class << self
      def manufacturer
        parse('aircraft.manufacturer')
      end
    end
  end
end
