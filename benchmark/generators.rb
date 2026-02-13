# frozen_string_literal: true

require 'benchmark/ips'
require 'faker'

def generators
  faker_descendants(Faker).flat_map { |klass| subclass_methods(klass) }
end

def faker_descendants(mod)
  mod.constants.flat_map do |const|
    next if skipped_constants.include?(const)

    value = mod.const_get(const)

    case value
    when Class
      value < Faker::Base ? [value] : []
    when Module
      faker_descendants(value)
    else
      []
    end
  end
end

def subclass_methods(klass)
  (klass.singleton_methods(false) - Faker::Base.singleton_methods(false))
    .filter_map do |method|
      parameters = klass.method(method).parameters

      if parameters.none? { |type, _| [:req, :keyreq].include?(type) }
        [klass, method]
      end
    end
end

def skipped_constants
  %i[
    Base
    Base58
    Cat
    Char
    Config
    Deprecator
    Dog
    VERSION
  ]
end

all_generators = generators

Benchmark.ips do |x|
  x.report("Number of generators: #{all_generators.count}") do
    all_generators.each { |klass, generator| klass.public_send(generator) }
  end
end
