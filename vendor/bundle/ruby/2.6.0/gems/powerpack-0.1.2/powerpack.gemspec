# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'powerpack/version'

Gem::Specification.new do |spec|
  spec.name          = 'powerpack'
  spec.version       = Powerpack::VERSION
  spec.authors       = ['Bozhidar Batsov']
  spec.email         = ['bozhidar@batsov.com']
  spec.description   = 'A few useful extensions to core Ruby classes.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/bbatsov/powerpack'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('yard', '~> 0.9')
end
