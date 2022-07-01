# frozen_string_literal: true

module Faker
  class Leaner
    class Property < Base
      class << self
        def key
          parse('leaner.property.key')
        end
      end
    end
  end
end
