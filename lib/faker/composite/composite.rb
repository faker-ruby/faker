# frozen_string_literal: true

module Faker
  class Composite < Base
    attr_reader :generator_classes

    def initialize(*generator_classes)
      @generator_classes = generator_classes
    end

    def respond_to_missing?(method)
      generator_classes.all? { |klass| klass.respond_to?(method) }
    end

    def methods
      methods = generator_classes[0].methods
      generator_classes.each { |klass| methods &= klass.methods }
      methods
    end

    # @param [Symbol] method
    # @param [Array] args
    # @return [Object]
    def method_missing(method, *args)
      if respond_to_missing?(method)
        klass = generator_classes.sample
        return klass.send(method.to_s, *args)
      end
      super
    end
  end
end