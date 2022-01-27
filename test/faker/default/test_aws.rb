# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerAws < Test::Unit::TestCase
  def setup
    @tester = Faker::Aws
  end

  def test_account_id
    assert @tester.account_id.match(/^\d{10}$/)
  end

  def test_acm_arn
    assert @tester.acm_arn.match(/arn:aws:acm:\w+-\w+-\d:\d{10}:certificate\/[\w\-]+/)
  end

  def test_alb_arn
    assert @tester.alb_arn.match(/arn:aws:elasticloadbalancing:\w+-\w+-\d:\d{10}:loadbalancer\/app\/[\w\-]+\/+/)
  end

  def test_alb_target_group_arn
    assert @tester.alb_target_group_arn.match(/arn:aws:elasticloadbalancing:\w+-\w+-\d:\d{10}:targetgroup\/[\w\-]+\/+/)
  end

  def test_route53_zone_id
    assert @tester.route53_zone_id.match(/\w{21}/)
  end

  def test_security_group_id
    assert @tester.security_group_id.match(/sg-[0-9a-f]{16}/)
  end

  def test_subnet_id
    assert @tester.subnet_id.match(/subnet-[0-9a-f]{16}/)
  end

  def test_vpc_id
    assert @tester.vpc_id.match(/vpc-[0-9a-f]{16}/)
  end
end
