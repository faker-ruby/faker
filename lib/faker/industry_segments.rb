# frozen_string_literal: true

module Faker
  class IndustrySegments < Base
    flexible :industry_segments

    class << self
      def industry
        fetch('industry_segments.industry')
      end

      def super_sector
        fetch('industry_segments.super_sector')
      end

      def sector
        fetch('industry_segments.sector')
      end

      def sub_sector
        fetch('industry_segments.sub_sector')
      end
    end
  end
end
