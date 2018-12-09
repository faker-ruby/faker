# frozen_string_literal: true

module Faker
  class Marketing < Base
    flexible :marketing

    class << self
      def buzzwords
        fetch('marketing.buzzwords')
      end
    end
  end
end
