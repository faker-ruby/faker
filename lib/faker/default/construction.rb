# frozen_string_literal: true

module Faker
  class Construction < Base
    def self.material
      fetch('construction.materials')
    end

    def self.heavy_equipment
      fetch('construction.heavy_equipment')
    end

    def self.trade
      fetch('construction.trades')
    end

    def self.subcontract_category
      fetch('construction.subcontract_categories')
    end

    def self.standard_cost_code
      fetch('construction.standard_cost_codes')
    end

    def self.role
      fetch('construction.roles')
    end
  end
end
