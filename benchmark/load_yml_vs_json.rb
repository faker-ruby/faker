# frozen_string_literal: true

require 'benchmark/ips'
require 'json'
require 'yaml'

Benchmark.ips do |x|
  x.report('YML') { YAML.load_file(File.expand_path("#{File.dirname(__FILE__)}/../lib/locales/es-MX.yml")) }
  x.report('JSON') { JSON.load_file("#{File.dirname(__FILE__)}/../test/fixtures/locales/es-MX.json") }

  x.compare!(order: :baseline)
end
