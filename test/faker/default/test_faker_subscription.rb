# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerSubscription < Test::Unit::TestCase
  def setup
    @tester = Faker::Subscription
  end

  def test_plan
    assert @tester.plan.match?(/\w+/)
  end

  def test_status
    assert @tester.status.match?(/\w+/)
  end

  def test_payment_method
    assert @tester.payment_method.match?(/\w+/)
  end

  def test_subscription_term
    assert @tester.subscription_term.match?(/\w+/)
  end

  def test_payment_term
    assert @tester.payment_term.match?(/\w+/)
  end
end
