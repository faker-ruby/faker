# frozen_string_literal: true

module Faker
  class Construction < Base
    def self.materials
      fetch('construction.materials')
    end
  end
end
