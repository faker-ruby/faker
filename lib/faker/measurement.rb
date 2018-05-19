module Faker
  class Measurement < Base
    class << self
      def height(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.height'), amount)}"
      end

      def height_all
        make_plural(fetch('measurement.height'))
      end

      def height_none
        fetch('measurement.height')
      end

      def length(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.length'), amount)}"
      end

      def length_all
        make_plural(fetch('measurement.length'))
      end

      def length_none
        fetch('measurement.length')
      end

      def volume(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.volume'), amount)}"
      end

      def volume_all
        make_plural(fetch('measurement.volume'))
      end

      def volume_none
        fetch('measurement.volume')
      end

      def weight(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.weight'), amount)}"
      end

      def weight_all
        make_plural(fetch('measurement.weight'))
      end

      def weight_none
        fetch('measurement.weight')
      end

      def metric_height(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.metric_height'), amount)}"
      end

      def metric_height_all
        make_plural(fetch('measurement.metric_height'))
      end

      def metric_height_none
        fetch('measurement.metric_height')
      end

      def metric_length(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.metric_length'), amount)}"
      end

      def metric_length_all
        make_plural(fetch('measurement.metric_length'))
      end

      def metric_length_none
        fetch('measurement.metric_length')
      end

      def metric_volume(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.metric_volume'), amount)}"
      end

      def metric_volume_all
        make_plural(fetch('measurement.metric_volume'))
      end

      def metric_volume_none
        fetch('measurement.metric_volume')
      end

      def metric_weight(amount = rand(10))
        ensure_valid_amount(amount)

        "#{amount} #{check_for_plural(fetch('measurement.metric_weight'), amount)}"
      end

      def metric_weight_all
        make_plural(fetch('measurement.metric_weight'))
      end

      def metric_weight_none
        fetch('measurement.metric_weight')
      end

      private

      def ensure_valid_amount(amount)
        raise ArgumentError, 'invalid amount' unless amount.is_a?(Integer) || amount.is_a?(Float)
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
