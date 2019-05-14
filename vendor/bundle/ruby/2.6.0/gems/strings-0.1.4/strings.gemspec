# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "strings/version"

Gem::Specification.new do |spec|
  spec.name          = "strings"
  spec.version       = Strings::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = [""]

  spec.summary       = %q{A set of useful functions for transforming strings.}
  spec.description   = %q{A set of useful functions such as fold, truncate, wrap and more for transoforming strings.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir['{lib,spec}/**/*.rb', '{bin,tasks}/*', 'strings.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'strings-ansi',         '~> 0.1.0'
  spec.add_dependency 'unicode_utils',        '~> 1.4.0'
  spec.add_dependency 'unicode-display_width','~> 1.4.0'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
