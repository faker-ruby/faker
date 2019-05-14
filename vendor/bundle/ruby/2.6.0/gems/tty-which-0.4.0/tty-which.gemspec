lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tty/which/version'

Gem::Specification.new do |spec|
  spec.name          = "tty-which"
  spec.version       = TTY::Which::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = [""]
  spec.summary       = %q{Platform independent implementation of Unix which command.}
  spec.description   = %q{Platform independent implementation of Unix which command.}
  spec.homepage      = "http://piotrmurach.github.io/tty/"
  spec.license       = "MIT"

  spec.files         = Dir['{lib,spec}/**/*.rb']
  spec.files        += Dir['tasks/*', 'tty-which.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '>= 1.5.0', '< 2.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'rake'
end
