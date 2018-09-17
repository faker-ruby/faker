# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'faker/version'

Gem::Specification.new do |spec|
  spec.name        = 'faker'
  spec.version     = Faker::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Benjamin Curtis']
  spec.email       = ['benjamin.curtis@gmail.com']
  spec.homepage    = 'https://github.com/stympy/faker'
  spec.summary     = 'Easily generate fake data'
  spec.description = 'Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.'
  spec.license     = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[History.md License.txt CHANGELOG.md README.md]
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency('i18n', '>= 0.7')
  spec.add_runtime_dependency 'thor'

  spec.add_development_dependency('minitest')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('test-unit')
  spec.add_development_dependency('timecop')
end
