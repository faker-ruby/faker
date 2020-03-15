# frozen_string_literal: true

module Faker
  class Computer < Base
    class << self
      ##
      # Produces the name of a computer platform.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.platform #=> "Linux"
      #
      # @faker.version next
      def platform
        fetch('computer.platform')
      end

      ##
      # Produces the name of a computer type.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.type #=> "server"
      #
      # @faker.version next
      def type
        fetch('computer.type')
      end

      ##
      # Produces the name of a computer os.
      #
      # @return [String]
      #
      # @example
      #   Faker::Computer.os #=> "RHEL 6.10"
      #
      # @faker.version next
      def os(plat = platform)
        plat = platform unless fetch_all('computer.platform').include?(plat)
        plat = search_format(plat)
        fetch("computer.#{plat}.os")
      end

      def stack
        plat = platform
        os = fetch("computer.os.#{search_format(plat)}")
        "#{plat}, #{os}"
      end

      private

      def search_format(key)
        key.split.length > 1 ? key.split.join('_').downcase : key.downcase
      end
    end
  end
end
