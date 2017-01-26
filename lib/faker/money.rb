module Faker
  class Money < Base
    flexible :money

    class << self
      # S Korea, Japan and Vietnam don't have a decimal notation in currency.
      @@zero_decimals = ["ko", "ja", "vi"]

      def money(min=0, max=100, decimal_place=2)
        decimal_place = 0 if @@zero_decimals.include?(Faker::Config.locale.to_s)
        Random.new.rand(min..max.to_f).round(decimal_place)
      end

      # Return a float format string. If it has only one decimal place, append '0' to the end.
      # e.g., return "52.70" instead of "52.7"
      def money_with_zero_padding(min=0, max=100, decimal_place=2)
        amount = money(min, max, decimal_place)
        money_parts = amount.to_s.split('.')
        return amount.to_s if money_parts.length < 2
        money_parts[0] + "." + money_parts[-1].ljust(decimal_place, "0")
      end

      def money_with_symbol(min=0, max=100, decimal_place=2)
        "#{fetch('currency.symbol')}#{money_with_zero_padding(min, max, decimal_place)}"
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
