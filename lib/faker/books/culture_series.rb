# frozen_string_literal: true

module Faker
  class Books
    class CultureSeries < Base
      flexible :culture_series
      class << self
        def book
          fetch('culture_series.books')
        end

        def culture_ship
          fetch('culture_series.culture_ships')
        end

        def culture_ship_class
          fetch('culture_series.culture_ship_classes')
        end

        def culture_ship_class_abv
          fetch('culture_series.culture_ship_class_abvs')
        end

        def civ
          fetch('culture_series.civs')
        end

        def planet
          fetch('culture_series.planets')
        end
      end
    end
  end
end
