# frozen_string_literal: true
require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestDeterminism < Test::Unit::TestCase

  def setup
    @all_methods= all_methods.freeze
    @first_run= []
  end

  def test_determinism
    Faker::Config.random = Random.new(42)
    @all_methods.each_index do |index|
      store_result @all_methods[index]
    end
    @first_run.freeze
    Faker::Config.random = Random.new(42)
    @all_methods.each_index do |index|
      assert deterministic_random? @first_run[index], @all_methods[index]
    end
  end

private

  def deterministic_random? first, method_name
    second= eval(method_name)
    (first== second) || raise(
      "#{method_name} has an entropy leak; use \"Faker::Config.random.rand\" or \"Array#sample(random: Faker::Config.random)\". Method to lookup for: sample, shuffle, rand"
    )
  end

  def store_result method_name
    begin
      @first_run<< eval(method_name)
    rescue => exception
      raise %Q[#{method_name} raised "#{exception}"]
    end
  end

  def all_methods
    subclasses.map do |subclass|
      subclass_methods(subclass).flatten
    end.flatten.sort
  end

  def subclasses
    Faker.constants.delete_if do |subclass|
      [:Base, :Char, :Config, :Date, :Internet, :Time, :VERSION].include?(subclass)
    end.sort
  end

  def subclass_methods(subclass)
    eval("Faker::#{subclass}.public_methods(false) - Faker::Base.public_methods(false)").sort.map do |method|
      "Faker::#{subclass}.#{method}"
    end.sort
  end
end