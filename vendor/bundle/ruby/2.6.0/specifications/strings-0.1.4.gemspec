# -*- encoding: utf-8 -*-
# stub: strings 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "strings".freeze
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Murach".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-09-10"
  s.description = "A set of useful functions such as fold, truncate, wrap and more for transoforming strings.".freeze
  s.email = ["".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A set of useful functions for transforming strings.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<strings-ansi>.freeze, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<unicode_utils>.freeze, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<unicode-display_width>.freeze, ["~> 1.4.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<strings-ansi>.freeze, ["~> 0.1.0"])
      s.add_dependency(%q<unicode_utils>.freeze, ["~> 1.4.0"])
      s.add_dependency(%q<unicode-display_width>.freeze, ["~> 1.4.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<strings-ansi>.freeze, ["~> 0.1.0"])
    s.add_dependency(%q<unicode_utils>.freeze, ["~> 1.4.0"])
    s.add_dependency(%q<unicode-display_width>.freeze, ["~> 1.4.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
