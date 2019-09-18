# frozen_string_literal: true

module Faker
  class Restaurant < Base
    flexible :restaurant

    def self.name
      bothify(parse('restaurant.name'))
    end
  end
end
