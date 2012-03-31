module Faker
  class Vat
    class Poland

      class << self

        # Due to http://pl.wikipedia.org/wiki/NIP (only polish version).
        #
        def number
          sum = 10
          vat_in = []
          while sum == 10
            vat_in = Array.new(9) { rand(10) }
            sum = vat_in.zip([6, 5, 7, 2, 3, 4, 5, 6, 7]).map{ |a| a.inject(&:*)}.inject(&:+) % 11
          end
          (vat_in << sum).join
        end

      end

    end
  end
end
