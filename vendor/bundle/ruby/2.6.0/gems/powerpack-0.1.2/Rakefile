require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yard'

desc "Run specs"
task :default => :spec

RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
end
