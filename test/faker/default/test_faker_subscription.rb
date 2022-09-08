# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSubscription < Test::Unit::TestCase
  def setup
    @tester = Faker::Subscription
  end

  def test_plan
    assert_match(/\w+/, @tester.plan)
  end

  def test_status
    assert_match(/\w+/, @tester.status)
  end

  def test_payment_method
    assert_match(/\w+/, @tester.payment_method)
  end

  def test_subscription_term
    assert_match(/\w+/, @tester.subscription_term)
  end

  def test_payment_term
    assert_match(/\w+/, @tester.payment_term)
  end
end
