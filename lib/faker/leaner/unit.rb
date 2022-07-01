# frozen_string_literal: true

module Faker
  class Leaner
    class Unit < Base
      class << self
        def unit
          parse('leaner.unit')
        end
      end
    end
  end
end
