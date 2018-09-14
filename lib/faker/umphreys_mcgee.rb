# frozen_string_literal: true

module Faker
  class UmphreysMcgee < Base
    class << self
      def song
        fetch('umphreys_mcgee.song')
      end
    end
  end
end
