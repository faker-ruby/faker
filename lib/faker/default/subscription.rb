# frozen_string_literal: true

module Faker
  class Subscription < Base
    def self.plan
      fetch('subscription.plans')
    end

    def self.status
      fetch('subscription.statuses')
    end

    def self.payment_method
      fetch('subscription.payment_methods')
    end

    def self.subscription_term
      fetch('subscription.subscription_terms')
    end

    def self.payment_term
      fetch('subscription.payment_terms')
    end
  end
end
