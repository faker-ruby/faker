# frozen_string_literal: true

module Faker
  class Construction < Base
    def self.material
      fetch('construction.materials')
    end

    def self.subcontract_category
      fetch('construction.subcontract_categories')
    end
  end
end
