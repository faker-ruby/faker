module Faker
  class Money < Base
    flexible :money

    class << self
      def money(min=0, max=100, decimal_place=2)
        zero_decimals = [:ko, :ja, :vi]
        decimal_place = 0 if zero_decimals.include?(Faker::Config.locale)

        Random.new.rand(min..max.to_f).round(decimal_place)
      end

      def zero_padding(min=0, max=100, decimal_place=2)
        amount = money(min, max, decimal_place)
        return amount if decimal_place < 1

        money_parts = amount.to_s.split('.')
        money_parts[0] + "." + money_parts[-1].ljust(decimal_place, "0")
      end

      def money_with_symbol(min=0, max=100, decimal_place=2)
        "#{fetch('currency.symbol')}#{zero_padding(min, max, decimal_place)}"
      end

      def money_without_cents(min=0, max=100)
        Random.new.rand(min..max)
      end

      def money_without_cents_with_symbol(min=0, max=100)
        "#{fetch('currency.symbol')}#{money_without_cents(min, max)}"
      end
    end
  end
end
