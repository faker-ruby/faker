# frozen_string_literal: true

module Faker
  class Phone < Base
    class << self
      def name
        fetch('phone.name')
      end
    end
  end
end

