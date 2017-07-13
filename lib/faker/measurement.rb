module Faker
  class Measurement < Base
    class << self
      ALL = "all"
      NONE = "none"

      def height(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.height'))
        elsif amount == NONE
          fetch('measurement.height')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.height'), amount)}"
        end
      end

      def length(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.length'))
        elsif amount == NONE
          fetch('measurement.length')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.length'), amount)}"
        end
      end

      def volume(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.volume'))
        elsif amount == NONE
          fetch('measurement.volume')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.volume'), amount)}"
        end
      end

      def weight(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.weight'))
        elsif amount == NONE
          fetch('measurement.weight')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.weight'), amount)}"
        end
      end

      def metric_height(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.height'))
        elsif amount == NONE
          fetch('measurement.height')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.height'), amount)}"
        end
      end

      def metric_length(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.length'))
        elsif amount == NONE
          fetch('measurement.length')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.length'), amount)}"
        end
      end

      def metric_volume(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.volume'))
        elsif amount == NONE
          fetch('measurement.volume')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.volume'), amount)}"
        end
      end

      def metric_weight(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.weight'))
        elsif amount == NONE
          fetch('measurement.weight')
        else
          "#{amount.to_s} #{check_for_plural(fetch('measurement.weight'), amount)}"
        end
      end

      private

      def ensure_valid_amount(amount)
        unless amount == NONE || amount == ALL || amount.is_a?(Integer) || amount.is_a?(Float)
          raise ArgumentError, 'invalid amount'
        end
      end

      def check_for_plural(text, number)
        if number && number != 1
          make_plural(text)
        else
          text
        end
      end

      def make_plural(text)
        case text
        when "foot"
          "feet"
        when "inch"
          "inches"
        when "fluid ounce"
          "fluid ounces"
        when "metric ton"
          "metric tons"
        else
          "#{text}s"
        end
      end
    end
  end
end
