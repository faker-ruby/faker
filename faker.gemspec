$:.push File.expand_path("../lib", __FILE__)
require "faker/version"

Gem::Specification.new do |s|
  s.name        = "faker"
  s.version     = Faker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Benjamin Curtis"]
  s.email       = ["benjamin.curtis@gmail.com"]
  s.homepage    = "https://github.com/stympy/faker"
  s.summary     = %q{Easily generate fake data}
  s.description = %q{Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.}
  s.license     = 'MIT'

  s.add_runtime_dependency('i18n', '~> 0.5')

  s.files         = Dir['lib/**/*'] + %w(History.md License.txt CHANGELOG.md README.md)
  s.executables   = Dir['bin/*'].map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
