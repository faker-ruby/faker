
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "strings/ansi/version"

Gem::Specification.new do |spec|
  spec.name          = "strings-ansi"
  spec.version       = Strings::ANSI::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = [""]

  spec.summary       = %q{Methods for processing ANSI escape codes in strings.}
  spec.description   = %q{Methods for processing ANSI escape codes in strings.}
  spec.homepage      = "https://github.com/piotrmurach/strings"
  spec.license       = "MIT"

  spec.files         = Dir['{lib,spec}/**/*.rb', '{bin,tasks}/*', 'strings-ansi.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
