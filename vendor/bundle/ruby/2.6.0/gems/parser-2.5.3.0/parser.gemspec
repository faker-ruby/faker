# encoding: utf-8
# frozen_string_literal: true

require File.expand_path('../lib/parser/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'parser'
  spec.version       = Parser::VERSION
  spec.authors       = ['whitequark']
  spec.email         = ['whitequark@whitequark.org']
  spec.description   = 'A Ruby parser written in pure Ruby.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/whitequark/parser'
  spec.license       = 'MIT'
  spec.has_rdoc      = 'yard'

  spec.files         = `git ls-files`.split + %w(
                          lib/parser/lexer.rb
                          lib/parser/ruby18.rb
                          lib/parser/ruby19.rb
                          lib/parser/ruby20.rb
                          lib/parser/ruby21.rb
                          lib/parser/ruby22.rb
                          lib/parser/ruby23.rb
                          lib/parser/ruby24.rb
                          lib/parser/ruby25.rb
                          lib/parser/ruby26.rb
                          lib/parser/macruby.rb
                          lib/parser/rubymotion.rb
                       )
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency             'ast',       '~> 2.4.0'

  spec.add_development_dependency 'bundler',   '~> 1.15'
  spec.add_development_dependency 'rake',      '~> 10.0'
  spec.add_development_dependency 'racc',      '= 1.4.14'
  spec.add_development_dependency 'cliver',    '~> 0.3.2'

  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'kramdown'

  spec.add_development_dependency 'minitest',  '~> 5.10'
  spec.add_development_dependency 'simplecov', '~> 0.15.1'

  spec.add_development_dependency 'gauntlet'
end
