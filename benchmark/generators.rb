# frozen_string_literal: true

require 'benchmark/ips'
require 'faker'

def all_generators
  generators.map do |klass|
    subclass_methods(klass).flatten
  end.flatten.sort
end

def generators
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
  eval("Faker::#{subclass}.public_methods(false) - Faker::Base.public_methods(false)").sort.map do |method|
    "Faker::#{subclass}.#{method}"
  end.sort
end

Benchmark.ips do |x|
  x.report("Number of generators: #{all_generators.count}") do
    all_generators.each { |generator| eval(generator) }
  end
end
