# frozen_string_literal: true

require 'benchmark'

ms = Benchmark.realtime do
  require 'faker'
end * 1000

puts "took #{ms}ms to load"
