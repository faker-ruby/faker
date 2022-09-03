# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSubscription < Test::Unit::TestCase
  def setup
    @tester = Faker::Subscription
  end

  def test_plan
    assert_match @tester.plan, /\w+/
  end

  def test_status
    assert_match @tester.status, /\w+/
  end

  def test_payment_method
    assert_match @tester.payment_method, /\w+/
  end

  def test_subscription_term
    assert_match @tester.subscription_term, /\w+/
  end

  def test_payment_term
    assert_match @tester.payment_term, /\w+/
  end
end
