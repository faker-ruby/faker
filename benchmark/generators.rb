# frozen_string_literal: true

require 'benchmark/ips'
require 'faker'

def generators
  constants.flat_map do |klass|
    subclass_methods(klass)
  end
end

def constants
  Faker.constants.delete_if do |subclass|
    %i[
      Base
      Cat
      Char
      Base58
      Config
      Date
      Deprecator
      Dog
      Religion
      Time
      VERSION
    ].include?(subclass)
  end.sort
end

def subclass_methods(subclass)
  klass = Faker.const_get(subclass)

  public_methods = klass.public_methods(false) - Faker::Base.public_methods(false)

  public_methods.sort.map do |method|
    [klass, method]
  end
end

all_generators = generators

Benchmark.ips do |x|
  x.report("Number of generators: #{all_generators.count}") do
    all_generators.each { |klass, generator| klass.send(generator) }
  end
end
