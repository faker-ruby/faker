# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << '.'
  t.pattern = FileList['test/test*.rb']
  t.warning = true
end

task default: :test
