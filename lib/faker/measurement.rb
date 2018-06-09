module Faker
  class Measurement < Base
    class << self
      ALL = 'all'.freeze
      NONE = 'none'.freeze

      def height(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.height'))
        elsif amount == NONE
          fetch('measurement.height')
        else
          "#{amount} #{check_for_plural(fetch('measurement.height'), amount)}"
        end
      end

      def length(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.length'))
        elsif amount == NONE
          fetch('measurement.length')
        else
          "#{amount} #{check_for_plural(fetch('measurement.length'), amount)}"
        end
      end

      def volume(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.volume'))
        elsif amount == NONE
          fetch('measurement.volume')
        else
          "#{amount} #{check_for_plural(fetch('measurement.volume'), amount)}"
        end
      end

      def weight(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.weight'))
        elsif amount == NONE
          fetch('measurement.weight')
        else
          "#{amount} #{check_for_plural(fetch('measurement.weight'), amount)}"
        end
      end

      def metric_height(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.metric_height'))
        elsif amount == NONE
          fetch('measurement.metric_height')
        else
          "#{amount} #{check_for_plural(fetch('measurement.metric_height'), amount)}"
        end
      end

      def metric_length(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.metric_length'))
        elsif amount == NONE
          fetch('measurement.metric_length')
        else
          "#{amount} #{check_for_plural(fetch('measurement.metric_length'), amount)}"
        end
      end

      def metric_volume(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.metric_volume'))
        elsif amount == NONE
          fetch('measurement.metric_volume')
        else
          "#{amount} #{check_for_plural(fetch('measurement.metric_volume'), amount)}"
        end
      end

      def metric_weight(amount = rand(10))
        ensure_valid_amount(amount)
        if amount == ALL
          make_plural(fetch('measurement.metric_weight'))
        elsif amount == NONE
          fetch('measurement.metric_weight')
        else
          "#{amount} #{check_for_plural(fetch('measurement.metric_weight'), amount)}"
        end
      end

      private

      def ensure_valid_amount(amount)
        raise ArgumentError, 'invalid amount' unless amount == NONE || amount == ALL || amount.is_a?(Integer) || amount.is_a?(Float)
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
        when 'foot'
          'feet'
        when 'inch'
          'inches'
        when 'fluid ounce'
          'fluid ounces'
        when 'metric ton'
          'metric tons'
        else
          "#{text}s"
        end
      end
    end
  end
end
