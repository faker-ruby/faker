# -*- encoding: utf-8 -*-
# stub: pry 0.12.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pry".freeze
  s.version = "0.12.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Mair (banisterfiend)".freeze, "Conrad Irwin".freeze, "Ryan Fitzgerald".freeze, "Kyrylo Silin".freeze]
  s.date = "2018-11-12"
  s.description = "An IRB alternative and runtime developer console".freeze
  s.email = ["jrmair@gmail.com".freeze, "conrad.irwin@gmail.com".freeze, "rwfitzge@gmail.com".freeze, "silin@kyrylo.org".freeze]
  s.executables = ["pry".freeze]
  s.files = ["bin/pry".freeze]
  s.homepage = "http://pryrepl.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "An IRB alternative and runtime developer console".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<coderay>.freeze, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<method_source>.freeze, ["~> 0.9.0"])
    else
      s.add_dependency(%q<coderay>.freeze, ["~> 1.1.0"])
      s.add_dependency(%q<method_source>.freeze, ["~> 0.9.0"])
    end
  else
    s.add_dependency(%q<coderay>.freeze, ["~> 1.1.0"])
    s.add_dependency(%q<method_source>.freeze, ["~> 0.9.0"])
  end
end
