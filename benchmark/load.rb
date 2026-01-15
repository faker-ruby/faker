# frozen_string_literal: true

require 'benchmark/ips'

puts 'benchmarking loading'

if defined?(Faker)
  puts 'faker is already defined...'
  raise 'faker is defined before bench' if defined?(Faker)
end

Benchmark.ips do |x|
  x.report('Loading Time') do
    system('ruby load_faker.rb')
  end
end

Benchmark.ips do |x|
  x.report('autoload openssl') { system('AUTOLOAD=1 ruby load_faker.rb') }
  x.report('require openssl') { system('ruby load_faker.rb') }

  x.compare!(order: :baseline)
end
