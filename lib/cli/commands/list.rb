# frozen_string_literal: true

require_relative '../command'

module Faker
  module CLI
    module Commands
      class List < Command
        def execute(output: $stdout)
          result = Reflector.list(show_methods: options[:show_methods])
          render(result, output)
        end
      end
    end
  end
end
