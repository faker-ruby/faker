# frozen_string_literal: true

module Faker
  class MarketingBuzzwords < Base
    flexible :marketing_buzzwords

    class << self
      def buzzwords
        fetch('marketing_buzzwords.buzzwords')
      end
    end
  end
end
