# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in faker.gemspec
gemspec

install_if -> { RUBY_VERSION >= '2.7' && RUBY_VERSION < '3.0' } do # the ruby version used for linting in the github action
  gem 'syck', require: false
end
