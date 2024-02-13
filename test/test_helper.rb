# frozen_string_literal: true

require 'simplecov'

require 'simplecov_json_formatter'
SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter

SimpleCov.start do
  add_filter ['.bundle', 'lib/extensions', 'test']
end

require_relative 'support/assert_not_english'
require 'minitest/autorun'
require 'test/unit'
require 'rubygems'
require 'timecop'
require 'yaml'

YAML::ENGINE.yamler = 'psych' if defined? YAML::ENGINE
require File.expand_path("#{File.dirname(__FILE__)}/../lib/faker")

# deterministically_verify executes the test provided in the block successive
#   times with the same deterministic_random seed.
# @param subject_proc [Proc] a proc object that returns the subject under test
#   when called.
# @param depth [Integer] the depth of deterministic comparisons to run; the default value is 2.
# @param seed [Integer] A random number seed; Used to override the default value which is 42.
#
# @example
#   deterministically_verify ->{ @tester.username('bo peep') } do |subject|
#     assert subject.match(/(bo(_|\.)peep|peep(_|\.)bo)/)
#   end
#
def deterministically_verify(subject_proc, depth: 2, seed: 42)
  results = depth.times.map do
    Faker::Config.stub :random, Random.new(seed) do
      yield subject_proc.call.freeze
    end
  end

  results.combination(2) { |(first, second)| assert_equal first, second }
end
