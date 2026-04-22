# frozen_string_literal: true

require 'rake/testtask'
require 'open3'
require 'etc'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << '.'
  t.test_files = FileList['test/**/**/test*.rb']
  t.warning = true
end

task default: :test

namespace :test do
  desc 'Run each generator test file in isolation with FAKER_LAZY_LOAD=1 to catch lazy-loading cross-reference bugs'
  task :lazy_load do
    # Locale tests (test/test_*_locale.rb) only verify i18n data — they do not exercise
    # generator constant cross-references and are irrelevant to lazy loading.
    # Scoping to test/faker/ and test/helpers/ keeps the run fast and targeted.
    files    = FileList['test/faker/**/**/test*.rb', 'test/helpers/**/**/test*.rb'].to_a
    failures = []
    mutex    = Mutex.new
    workers  = [Etc.nprocessors, files.size].min

    threads = workers.times.map do
      Thread.new do
        loop do
          file = mutex.synchronize { files.shift }
          break unless file

          stdout, stderr, status = Open3.capture3(
            { 'FAKER_LAZY_LOAD' => '1' },
            RbConfig.ruby, '-Ilib', '-Itest', file
          )

          if status.success?
            mutex.synchronize do
              print '.'
              $stdout.flush
            end
          else
            mutex.synchronize do
              print 'F'
              $stdout.flush
              failures << { file: file, stdout: stdout, stderr: stderr }
            end
          end
        end
      end
    end

    threads.each(&:join)
    puts # newline after progress dots

    unless failures.empty?
      warn "\n#{'=' * 60}"
      warn "LAZY LOAD FAILURES (#{failures.size} file(s)):"
      failures.each do |f|
        warn "\n--- #{f[:file]} ---"
        warn f[:stdout] unless f[:stdout].empty?
        warn f[:stderr] unless f[:stderr].empty?
      end
      warn '=' * 60
      abort
    end
  end
end
