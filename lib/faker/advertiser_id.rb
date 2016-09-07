# encoding: utf-8
require 'securerandom'

module Faker
  class AdvertiserId < Base
    flexible :advertiser_id

    class << self
      def id
        SecureRandom.uuid.upcase
      end
    end
  end
end
