# encoding: utf-8

if RUBY_VERSION > '1.9' and (ENV['COVERAGE'] || ENV['TRAVIS'])
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    command_name 'spec'
    add_filter 'spec'
  end
end

require 'bundler/setup'
require 'tty/tree'
require 'fileutils'

module TestHelpers
  module Paths
    def gem_root
      File.expand_path("#{File.dirname(__FILE__)}/..")
    end

    def dir_path(*args)
      path = File.join(gem_root, *args)
      FileUtils.mkdir_p(path)
      File.realpath(path)
    end

    def tmp_path(*args)
      File.join(dir_path('tmp'), *args)
    end

    def fixtures_path(*args)
      File.join(dir_path('spec/fixtures'), *args)
    end

    def within_dir(target, &block)
      ::Dir.chdir(target, &block)
    end
  end
end

RSpec.configure do |config|
  config.include(TestHelpers::Paths)
  # config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.order = :random

  Kernel.srand config.seed
end
