# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'faker/version'

Gem::Specification.new do |spec|
  spec.name        = 'faker'
  spec.version     = Faker::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Benjamin Curtis']
  spec.email       = ['benjamin.curtis@gmail.com']

  spec.summary     = 'Easily generate fake data'
  spec.description = 'Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.'
  spec.homepage    = 'https://github.com/stympy/faker'
  spec.license     = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[History.md License.txt CHANGELOG.md README.md]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) do |file|
    File.basename(file)
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency('thor', '0.20.0')

  spec.add_development_dependency('bundler', '1.16.4')
  spec.add_development_dependency('minitest', '5.11.3')
  spec.add_development_dependency('rake', '12.3.1')
  spec.add_development_dependency('rubocop', '0.59.1')
  spec.add_development_dependency('simplecov', '0.16.1')
  spec.add_development_dependency('test-unit', '3.2.8')
  spec.add_development_dependency('timecop', '0.9.1')

  spec.add_runtime_dependency('i18n', '>= 0.7')
end
