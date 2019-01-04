# frozen_string_literal: true

require_relative '../test_helper'

require 'cli'

module MockFaker
  class Foo
    def self.bar
      'bar'
    end
  end
end

describe Faker::CLI::Renderer do
  before do
    @renderer = Faker::CLI::Renderer
  end

  describe '#call' do
    # TODO: describe 'when paginable object'

    describe 'when non paginable interface' do
      it 'renders the full content' do
        hash = { MockFaker::Foo => [:bar] }
        options = {}
        output = StringIO.new

        renderer = @renderer.new(hash, options, output)
        renderer.call

        assert_equal "MockFaker::Foo\n└── bar\n", output.string
      end
    end
  end

  describe '#render' do
    describe 'when the verbose option is enabled' do
      it 'renders methods with data' do
        hash = { MockFaker::Foo => [:bar] }
        options = { verbose: true }
        output = StringIO.new

        renderer = @renderer.new(hash, options, output)
        result = renderer.render

        assert_equal "MockFaker::Foo\n└── bar=> bar\n", result
        assert_empty output.string
      end
    end

    describe 'when the verbose option is disabled' do
      it 'renders methods only' do
        hash = { MockFaker::Foo => [:bar] }
        options = { verbose: false }
        output = StringIO.new

        renderer = @renderer.new(hash, options, output)
        result = renderer.render

        assert_equal "MockFaker::Foo\n└── bar\n", result
        assert_empty output.string
      end
    end
  end

  describe '#tree' do
    it 'returns the tree object' do
      hash = { MockFaker::Foo => [:bar] }
      options = {}
      output = StringIO.new

      renderer = @renderer.new(hash, options, output)
      result = renderer.tree

      assert_equal true, result.nodes.size.positive?
      assert_kind_of TTY::Tree, result
      assert_empty output.string
    end

    it 'memoizes the tree object' do
      hash = { MockFaker::Foo => [:bar] }
      options = {}
      output = StringIO.new

      renderer = @renderer.new(hash, options, output)
      first_result = renderer.tree
      second_result = renderer.tree

      assert_equal first_result, second_result
    end
  end

  describe '#gt_screen_height?' do
    describe 'when tree size is greater than the screen size' do
      it 'returns true' do
        hash = { MockFaker::Foo => [:bar] }
        options = {}
        output = StringIO.new

        TTY::Screen.stub :height, 1 do
          renderer = @renderer.new(hash, options, output)
          result = renderer.gt_screen_height?

          assert_equal true, result
        end
      end
    end

    describe 'when the tree size is less than the screen size' do
      it 'returns false' do
        hash = { MockFaker::Foo => [:bar] }
        options = {}
        output = StringIO.new

        renderer = @renderer.new(hash, options, output)
        result = renderer.gt_screen_height?

        assert_equal false, result
      end
    end
  end

  describe '#paginable?' do
    describe 'when interactive terminal' do
      it 'returns true' do
        hash = { MockFaker::Foo => [:bar] }
        options = {}

        output_mock = Minitest::Mock.new

        def output_mock.tty?
          true
        end

        TTY::Screen.stub :height, 1 do
          renderer = @renderer.new(hash, options, output_mock)
          result = renderer.paginable?

          assert_equal true, result
        end
      end
    end

    describe 'when non-interactive terminal' do
      it 'returns false' do
        hash = { MockFaker::Foo => [:bar] }
        options = {}
        output = StringIO.new

        renderer = @renderer.new(hash, options, output)
        result = renderer.paginable?

        assert_equal false, result
      end
    end
  end
end
