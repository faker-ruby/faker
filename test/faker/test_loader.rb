# frozen_string_literal: true

require_relative '../test_helper'

class TestLoader < Test::Unit::TestCase
  FIXTURES_DIR = File.expand_path('../fixtures', __dir__)

  class FakeRequirer
    attr_reader :loaded_files

    def initialize(failing_paths: [])
      @failing_paths = failing_paths
      @loaded_files = []
      @mutex = Mutex.new
    end

    def call(path)
      raise LoadError if @failing_paths.any? do |suffix|
        path.end_with?(suffix)
      end

      @mutex.synchronize { @loaded_files << path }
    end
  end

  FakeConfig = Struct.new(:lazy_loading?)

  def eager_loader(requirer:)
    Faker::Loader.new(FIXTURES_DIR, FakeConfig.new(false), requirer: requirer)
  end

  def lazy_loader(requirer:)
    Faker::Loader.new(FIXTURES_DIR, FakeConfig.new(true), requirer: requirer)
  end

  def test_strategy_does_not_change_after_first_use
    config = FakeConfig.new(false)
    loader = Faker::Loader.new(FIXTURES_DIR, config, requirer: FakeRequirer.new)

    loader.load_const('Faker', :Gadget)
    config[:lazy_loading?] = true

    assert_equal :eager, loader.loading_strategy
  end

  def test_falls_back_to_default_path_on_load_error
    non_default_path = ['faker/gadget']
    requirer = FakeRequirer.new(failing_paths: non_default_path)

    loader = lazy_loader(requirer: requirer)

    loader.load_const('Faker', :Gadget)

    assert requirer.loaded_files.any? { |f| f.include?('faker/default/gadget') }
  end

  def test_inflection_resolves_correctly
    requirer = FakeRequirer.new
    loader = lazy_loader(requirer: requirer)

    loader.load_const('Faker::Games', :DnD)

    assert_includes requirer.loaded_files.first, 'faker/games/dnd'
    refute_includes requirer.loaded_files.first, 'dn_d'
  end

  def test_install_on_installs_const_missing
    requirer = FakeRequirer.new
    loader = lazy_loader(requirer: requirer)
    klass = Class.new

    loader.install_on(klass)

    assert_equal klass.singleton_class, klass.method(:const_missing).owner
  end

  def test_eager_loads_all_files_on_first_const_access
    requirer = FakeRequirer.new
    loader = eager_loader(requirer: requirer)

    loader.load_const('Faker', :Gadget)

    actual_files = requirer.loaded_files.map do |loaded|
      loaded.match(/fixtures\/(?<path>.*)/)[:path]
    end.uniq

    expected_files = %w[
      faker/gadget.rb
      faker/default/widget.rb
      faker/games/dnd.rb
    ]

    expected_files.each do |file|
      assert_includes actual_files, file, "expected #{file} to be loaded"
    end
  end

  def test_eager_loads_only_once
    requirer = FakeRequirer.new
    loader = eager_loader(requirer: requirer)

    loader.load_const('Faker', :Gadget)

    count = requirer.loaded_files.size

    loader.load_const('Faker', :Gadget)

    assert_equal count, requirer.loaded_files.size
  end

  def test_lazy_loads_single_file_on_const_access
    requirer = FakeRequirer.new
    loader = lazy_loader(requirer: requirer)

    loader.load_const('Faker', :Gadget)

    assert_equal 1, requirer.loaded_files.size
    assert_includes requirer.loaded_files.first, 'faker/gadget'
  end

  def test_eager_loads_only_once_across_threads
    requirer = FakeRequirer.new
    loader = eager_loader(requirer: requirer)

    threads = 10.times.map do
      Thread.new { loader.load_const('Faker', :Gadget) }
    end

    threads.each(&:join)

    actual_files = requirer.loaded_files.map do |loaded|
      loaded.match(/fixtures\/(?<path>.*)/)[:path]
    end.compact

    assert_equal actual_files.uniq, actual_files
  end

  def test_raises_on_unknown_const
    non_existent_paths = ['faker/non_existent', 'faker/default/non_existent']
    requirer = FakeRequirer.new(failing_paths: non_existent_paths)

    loader = lazy_loader(requirer: requirer)

    assert_raises(LoadError) { loader.load_const('Faker', :NonExistent) }
  end
end
