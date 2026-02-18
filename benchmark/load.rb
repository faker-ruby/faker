# frozen_string_literal: true

require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('require') { system('ruby load_faker.rb') }
  x.report('autoload') { system('AUTOLOAD=1 ruby load_faker.rb') }

  x.compare!(order: :baseline)
end
