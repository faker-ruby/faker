require 'simplecov'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start do
  add_filter ['.bundle', 'test', 'lib/extensions']
end

require 'test/unit'
require 'rubygems'
require 'timecop'
require 'yaml'

YAML::ENGINE.yamler = 'psych' if defined? YAML::ENGINE
require File.expand_path(File.dirname(__FILE__) + '/../lib/faker')

# configure I18n
locales_path = File.expand_path(File.dirname(__FILE__) + '../lib/locales')
I18n.available_locales = Dir[locales_path + '/*'].map do |file|
  file.split('.').first
end
I18n.enforce_available_locales = true

# deterministically_verify executes the test provided in the block successive
#   times with the same deterministic_random seed.
# @param subject_proc [Proc] a proc object that returns the subject under test
#   when called.
# @param depth [Integer] the depth of deterministic comparisons to run.
# @param random [Integer] A random number seed; Used to override the default.
#
# @example
#   deterministically_verify ->{ @tester.user_name('bo peep') } do |subject|
#     assert subject.match(/(bo(_|\.)peep|peep(_|\.)bo)/)
#   end
#
def deterministically_verify(subject_proc, depth: 2, random: nil)
  raise 'need block' unless block_given?

  # rubocop:disable Style/MultilineBlockChain
  depth.times.inject([]) do |results, _index|
    Faker::Config.random = random || Random.new(42)
    results << subject_proc.call.freeze.tap { |s| yield(s) }
  end.repeated_combination(2) { |(first, second)| assert_equal first, second }
  # rubocop:enable Style/MultilineBlockChain
end
