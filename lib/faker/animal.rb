# frozen_string_literal: true

module Faker
  class Animal < Base
    class << self
      def name
        fetch('animal.name')
      end
    end
  end
end
