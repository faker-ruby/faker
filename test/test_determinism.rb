# frozen_string_literal: true

require_relative 'test_helper'

class TestDeterminism < Test::Unit::TestCase
  def setup
    @all_methods = all_methods.freeze
    @first_run = []
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

  def test_thread_safety
    expected_values = 2.times.map do |index|
      Faker::Config.random = Random.new(index)
      Faker::Number.digit
    end

    threads = expected_values.each_with_index.map do |expected_value, index|
      Thread.new do
        100_000.times.each do
          Faker::Config.random = Random.new(index)
          output = Faker::Number.digit

          assert_equal output, expected_value
        end
      end
    end

    threads.each(&:join)
  end

  private

  def deterministic_random?(first, entry)
    klass, method = entry
    second = klass.public_send(method)

    first == second || raise(
      "#{klass}.#{method} has an entropy leak; use Faker::Config.random"
    )
  end

  def store_result(entry)
    klass, method = entry
    @first_run << klass.public_send(method)
  end

  def all_methods
    faker_base_descendants
      .flat_map { |klass| subclass_methods(klass) }
      .sort_by { |klass, method| "#{klass}.#{method}" }
  end

  def faker_base_descendants
    ObjectSpace.each_object(Class)
               .select { |klass| klass < Faker::Base }
               .reject { |klass| skipped?(klass) }
  end

  def subclass_methods(klass)
    (klass.singleton_methods(false) - Faker::Base.singleton_methods(false))
      .map { |method| [klass, method] }
  end

  def skipped?(klass)
    skipped_classes.include?(klass.name.split('::').last.to_sym)
  end

  def skipped_classes
    %i[
      Base
      Base58
      Char
      ChileRut
      Config
      Internet
      VERSION
    ]
  end
end
