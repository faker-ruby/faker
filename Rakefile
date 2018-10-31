# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)

Dir['tasks/**/*.rake'].each { |rake| load rake }

require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Start a console session with Faker loaded'
task :console do
  require 'irb'
  require 'irb/completion'
  require 'faker' # You know what to do.

  ARGV.clear
  IRB.start
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %w[test rubocop]
