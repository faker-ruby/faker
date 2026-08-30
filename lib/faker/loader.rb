# frozen_string_literal: true

module Faker
  class Loader
    INFLECTIONS = { 'DnD' => 'dnd' }.freeze

    def initialize(base_dir, config, requirer: method(:require))
      @base_dir = base_dir
      @config = config
      @eager_loaded = false
      @mutex = Mutex.new
      @requirer = requirer
    end

    def load_const(context_name, class_name)
      @mutex.synchronize do
        if loading_strategy == :lazy
          resolve_const(context_name, class_name)
        else
          eager_load!
        end
      end
    end

    def install_on(klass)
      loader = self

      klass.define_singleton_method(:const_missing) do |class_name|
        loader.resolve_const(name, class_name)
        loader.fetch_const(self, name, class_name)
      end
    end

    def fetch_const(klass, context_name, class_name)
      unless klass.const_defined?(class_name, false)
        raise NameError, "uninitialized constant #{context_name}::#{class_name}"
      end

      klass.const_get(class_name)
    end

    def loading_strategy
      @loading_strategy ||= if @config.lazy_loading?
                              :lazy
                            else
                              :eager
                            end
    end

    def resolve_const(context_name, class_name)
      load_path = build_path(context_name, class_name)

      @requirer.call(load_path)
    rescue LoadError
      # try to load default generators
      @requirer.call load_path.gsub('faker/', 'faker/default/')
    end

    private

    def eager_load!
      return if @eager_loaded

      @eager_loaded = true

      parents = Dir.glob("#{@base_dir}/faker/*.rb")
      nested = Dir.glob("#{@base_dir}/faker/**/*.rb") - parents

      (parents + nested).each { |f| @requirer.call(f) }
    end

    def build_path(*constants)
      constants.map do |c|
        INFLECTIONS
          .reduce(c.to_s) { |s, (word, replacement)| s.gsub(word, replacement) }
          .gsub('::', '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
          .gsub(/([a-z\d])([A-Z])/, '\1_\2')
          .tr('-', '_')
          .downcase
      end.join('/')
    end
  end
end
