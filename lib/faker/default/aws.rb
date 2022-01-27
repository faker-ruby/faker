# frozen_string_literal: true

module Faker
  class Aws < Base
    REGIONS = %w[
      af-south-1 ap-east-1 ap-northeast-1 ap-northeast-2 ap-northeast-3
      ap-south-1 ap-southeast-1 ap-southeast-2 ap-southeast-3 ca-central-1
      eu-central-1 eu-north-1 eu-south-1 eu-west-1 eu-west-2 eu-west-3
      me-south-1 sa-east-1 us-east-1 us-east-2 us-west-1 us-west-2
    ].freeze

    class << self
      ##
      # Returns an account ID
      #
      # @return [Integer]
      #
      # @example
      #   Faker::Aws.account_id    #=> 886478821428
      def account_id
        Number.leading_zero_number(digits: 10)
      end

      ##
      # Returns an AWS Certificate Manager ARN
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.acm_arn    #=> "arn:aws:acm:us-west-2:885561613122:certificate/a41d8791-ad7b-4b68-9fe2-f6a9fb2b2ca6"
      def acm_arn
        "arn:aws:acm:#{rand_region}:#{account_id}:certificate/#{Internet.uuid}"
      end

      ##
      # Returns an Application Load Balancer ARN
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.alb_arn    #=> "arn:aws:elasticloadbalancing:us-west-2:485261713921:loadbalancer/app/holdlamis/3afc5d848d5d3499"
      #
      # @faker.version next
      def alb_arn
        "arn:aws:elasticloadbalancing:#{rand_region}:#{account_id}:loadbalancer/app/#{app_name}/#{rand_hex}"
      end

      ##
      # Returns an Application Load Balancer Target Group ARN
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.alb_target_group_arn    #=> "arn:aws:elasticloadbalancing:us-west-2:485261713921:targetgroup/zaam-dox/47a0bdd2e000b17a"
      #
      # @faker.version next
      def alb_target_group_arn
        "arn:aws:elasticloadbalancing:#{rand_region}:#{account_id}:targetgroup/#{app_name}/#{rand_hex}"
      end

      ##
      # Returns a Route53 zone ID
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.route53_zone_id    #=> "LDOJDOAMEHUIQJXHKJOJV"
      #
      # @faker.version next
      def route53_zone_id
        (0...21).map { rand(65..90).chr }.join
      end

      ##
      # Returns a security group ID
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.security_group_id    #=> "sg-6367c48dd193d56e"
      #
      # @faker.version next
      def security_group_id
        "sg-#{rand_hex}"
      end

      ##
      # Returns a subnet ID
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.subnet_id    #=> "subnet-7b2e47d667e591d8"
      #
      # @faker.version next
      def subnet_id
        "subnet-#{rand_hex}"
      end

      ##
      # Returns a VPC ID
      #
      # @return [String]
      #
      # @example
      #   Faker::Aws.vpc_id    #=> "vpc-222c7f89c8356ae7"
      #
      # @faker.version next
      def vpc_id
        "vpc-#{rand_hex}"
      end

      private

      def app_name
        App.name.downcase.gsub(/\s+/, '')
      end

      def rand_hex(length = 16)
        OpenSSL::Digest::SHA1.hexdigest(Lorem.characters)[0, length]
      end

      def rand_region
        sample(REGIONS)
      end
    end
  end
end
