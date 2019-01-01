# frozen_string_literal: true

module Faker
  class Quotes
    class SingularSiegler < Base
      class << self
        def quote
          fetch('singular_siegler.quotes')
        end
      end
    end
  end
end
