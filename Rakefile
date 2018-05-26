$LOAD_PATH.unshift File.dirname(__FILE__)

Dir['tasks/**/*.rake'].each { |rake| load rake }

require 'bundler'
Bundler::GemHelper.install_tasks

task :console do
  require 'irb'
  require 'irb/completion'
  require 'faker' # You know what to do.

  ARGV.clear
  IRB.start
end

task :coverage_report do
  require 'rubygems'
  require 'launchy'

  Launchy.open('coverage/index.html')
end

require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: %w[test rubocop]
