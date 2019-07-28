# frozen_string_literal: true

module Faker
  class Device < Base
    class << self
      def build_number
        Faker::Number.between(from: 1, to: 500)
      end

      def manufacturer
        fetch('device.manufacturer')
      end

      def model_name
        fetch('device.model_name')
      end

      def platform
        fetch('device.platform')
      end

      def serial
        fetch('device.serial')
      end

      def version
        Faker::Number.between(from: 1, to: 1000)
      end
    end
  end
end
