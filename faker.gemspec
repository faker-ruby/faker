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
  spec.bindir        = 'bin'
  spec.executables   = ['faker']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3'

  spec.metadata['changelog_uri'] = 'https://github.com/stympy/faker/blob/master/CHANGELOG.md'
  spec.metadata['source_code_uri'] = 'https://github.com/stympy/faker'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/stympy/faker/issues'

  spec.add_dependency('i18n', '>= 0.7')
  spec.add_dependency('pastel', '~> 0.7.2')
  spec.add_dependency('thor', '~> 0.20.0')
  spec.add_dependency('tty-pager', '~> 0.12.0')
  spec.add_dependency('tty-screen', '~> 0.6.5')
  spec.add_dependency('tty-tree', '~> 0.2.0')

  spec.add_development_dependency('minitest', '5.11.3')
  spec.add_development_dependency('pry', '0.12.2')
  spec.add_development_dependency('rake', '12.3.1')
  spec.add_development_dependency('rubocop', '0.59.1')
  spec.add_development_dependency('simplecov', '0.16.1')
  spec.add_development_dependency('test-unit', '3.2.8')
  spec.add_development_dependency('timecop', '0.9.1')
end
