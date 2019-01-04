# frozen_string_literal: true

require_relative '../command'

module Faker
  module CLI
    module Commands
      class Search < Faker::CLI::Command
        def initialize(options)
          @options = options
        end

        def execute(input, output: $stdout)
          result = Faker::CLI::Reflector.find(input)
          render(result, output)
        end

        private

        def render(result, output)
          return not_found if result.empty?

          super(result, output)
        end

        def not_found
          puts "\nSorry, we couldn't find a match 😢", "\n"
        end
      end
    end
  end
end
