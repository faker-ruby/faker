# frozen_string_literal: true

require_relative '../test_helper'

class TestLoader < Test::Unit::TestCase
  FIXTURES_DIR = File.expand_path('../fixtures', __dir__)

  FakeConfig = Struct.new(:lazy_loading?)

  def eager_loader = Faker::Loader.new(FIXTURES_DIR, FakeConfig.new(false))
  def lazy_loader = Faker::Loader.new(FIXTURES_DIR, FakeConfig.new(true))

  def with_require_spy(fail_if: nil)
    original = Kernel.instance_method(:require)
    loaded_files = []
    mutex = Mutex.new

    Kernel.define_method(:require) do |f|
      if fail_if&.call(f)
        raise LoadError
      end

      mutex.synchronize { loaded_files << f }
    end

    yield loaded_files
  ensure
    Kernel.define_method(:require, original)
  end

  def test_strategy_does_not_change_after_first_use
    config = FakeConfig.new(false)
    loader = Faker::Loader.new(FIXTURES_DIR, config)

    with_require_spy do
      loader.load_const('Faker', :Gadget)

      config[:lazy_loading?] = true

      assert_equal :eager, loader.loading_strategy
    end
  end

  def test_falls_back_to_default_path_on_load_error
    loader = lazy_loader

    fail_when_requiring_non_default_path = ->(f) { f.end_with?('faker/gadget') }

    with_require_spy(fail_if: fail_when_requiring_non_default_path) do |loaded_files|
      loader.load_const('Faker', :Gadget)

      assert loaded_files.any? { |f| f.include?('faker/default/gadget') }
    end
  end

  def test_inflection_resolves_correctly
    loader = lazy_loader

    with_require_spy do |loaded_files|
      loader.load_const('Faker::Games', :DnD)

      assert_includes loaded_files.first, 'faker/games/dnd'
      refute_includes loaded_files.first, 'dn_d'
    end
  end

  def test_install_on_installs_const_missing
    loader = lazy_loader
    klass = Class.new

    loader.install_on(klass)

    assert_equal klass.singleton_class, klass.method(:const_missing).owner
  end

  def test_eager_loads_all_files_on_first_const_access
    loader = eager_loader

    with_require_spy do |loaded_files|
      loader.load_const('Faker', :Gadget)

      actual_files = loaded_files.map do |loaded|
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
  end

  def test_eager_loads_only_once
    loader = eager_loader

    with_require_spy do |loaded_files|
      loader.load_const('Faker', :Gadget)

      count = loaded_files.size

      loader.load_const('Faker', :Gadget)

      assert_equal count, loaded_files.size
    end
  end

  def test_lazy_loads_single_file_on_const_access
    loader = lazy_loader

    with_require_spy do |loaded_files|
      loader.load_const('Faker', :Gadget)

      assert_equal 1, loaded_files.size
      assert_includes loaded_files.first, 'faker/gadget'
    end
  end

  def test_eager_loads_only_once_across_threads
    loader = eager_loader

    with_require_spy do |loaded_files|
      threads = 10.times.map do
        Thread.new { loader.load_const('Faker', :Gadget) }
      end

      threads.each(&:join)

      actual_files = loaded_files.map do |loaded|
        loaded.match(/fixtures\/(?<path>.*)/)[:path]
      end.compact

      assert_equal actual_files.uniq, actual_files
    end
  end

  def test_raises_on_unknown_const
    loader = lazy_loader

    assert_raises(LoadError) { loader.load_const('Faker', :NonExistent) }
  end
end
