# frozen_string_literal: true

module Faker
  class Loader
    INFLECTIONS = { 'DnD' => 'dnd' }.freeze

    def initialize(base_dir, config)
      @base_dir = base_dir
      @config = config
      @eager_loaded = false
      @mutex = Mutex.new
    end

    def load_const(context_name, class_name)
      @mutex.synchronize do
        if lazy_loading?
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

        const_get(class_name)
      end
    end

    def resolve_const(context_name, class_name)
      load_path = build_path(context_name, class_name)

      require(load_path)
    rescue LoadError
      # try to load default generators
      require(load_path.gsub('faker/', 'faker/default/'))
    end

    private

    def eager_load!
      return if @eager_loaded

      @eager_loaded = true

      Dir.glob(["#{@base_dir}/faker/*.rb", "#{@base_dir}/faker/**/*.rb"])
         .each { |f| require f }
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

    def lazy_loading?
      @lazy_loading ||= @config.lazy_loading?
    end
  end
end
