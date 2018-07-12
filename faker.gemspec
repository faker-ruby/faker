# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'faker/version'

Gem::Specification.new do |s|
  s.name        = 'faker'
  s.version     = Faker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Benjamin Curtis']
  s.email       = ['benjamin.curtis@gmail.com']
  s.homepage    = 'https://github.com/stympy/faker'
  s.summary     = 'Easily generate fake data'
  s.description = 'Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.'
  s.license     = 'MIT'

  s.add_runtime_dependency('i18n', '>= 0.7')
  s.add_development_dependency('launchy')
  s.add_development_dependency('minitest')
  s.add_development_dependency('rake')
  s.add_development_dependency('rubocop')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('timecop')
  s.required_ruby_version = '>= 2.3'

  s.files         = Dir['lib/**/*'] + %w[History.md License.txt CHANGELOG.md README.md]
  s.require_paths = ['lib']
end
