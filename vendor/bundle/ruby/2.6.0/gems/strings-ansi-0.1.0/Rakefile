require "bundler/gem_tasks"

FileList['tasks/**/*.rake'].each(&method(:import))

desc 'Run all specs'
task ci: %w[ spec ]

task default: :spec
