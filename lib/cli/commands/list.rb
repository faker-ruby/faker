# frozen_string_literal: true

require_relative '../command'

module Faker
  module CLI
    module Commands
      class List < Faker::CLI::Command
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
