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
      def os(p = platform)
        unless fetch_all('computer.platform').include?(p)
          p = platform
        end
        p = search_format(p)
        fetch("computer.#{p}.os")
      end

      def stack
        p = self.platform
        os = fetch("computer.os.#{search_format(p)}")
        "#{p}, #{os}"
      end


      private

      def search_format(key)
        key.split.length > 1 ? key.split.join('_').downcase : key.downcase
      end

    end
  end
end
