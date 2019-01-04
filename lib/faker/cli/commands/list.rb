require_relative '../command'

module Faker
  module CLI
    module Commands
      class List < Faker::CLI::Command
        def initialize(options)
          @options = options
        end

        def execute(output: $stdout)
          result = Faker::CLI::Reflector.list(
            show_methods: options[:show_methods]
          )
          render(result, output)
        end
      end
    end
  end
end
