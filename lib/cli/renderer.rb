# frozen_string_literal: true

require 'pastel'
require 'tty/pager'
require 'tty/screen'
require 'tty/tree'

module Faker
  module CLI
    class Renderer
      attr_reader :crayon, :hash, :options, :output, :pager

      def self.call(*args)
        new(*args).call
      end

      def initialize(hash, options, output)
        @hash = hash
        @options = options
        @output = output
        @crayon = Pastel.new(enabled: output.tty?)
        @pager = TTY::Pager.new(command: 'less -R')
      end

      def call
        if paginable?
          pager.page(render)
        else
          output.puts(render)
        end
      end

      def render
        tree.render
      end

      def tree
        @tree ||= TTY::Tree.new(build_tree)
      end

      def paginable?
        gt_screen_height? && output.tty?
      end

      def gt_screen_height?
        tree.nodes.size > TTY::Screen.height
      end

      private

      def build_tree
        results = hash.reduce({}) do |h, (const, methods)|
          h.merge! node(const, methods&.sort)
        end

        results.sort_by(&:to_s).to_h
      end

      def node(const, methods)
        {
          crayon.green(const.to_s) => leaf(const, methods)
        }
      end

      def leaf(const, methods)
        (methods || []).map { |m| crayon.cyan(*leaf_args(m, const)) }
      end

      def leaf_args(method, const)
        [method.to_s].tap { |arr| verbose_output(method, const, arr) if verbose? }
      end

      def verbose?
        options[:verbose]
      end

      def verbose_output(method, const, arr)
        fake, message = faker_method(method, const)
        arr << crayon.dim.white("=> #{fake}") << crayon.dim.magenta.bold(message.to_s)
      end

      def faker_method(method, const)
        [const.public_send(method), ensure_method_is_supported(method, const)]
      rescue ArgumentError => _exception
        ['N/A', '']
      end

      def ensure_method_is_supported(method, const)
        const.respond_to?(:"_deprecated_#{method}") ? ' ( WILL BE DEPRECATED )' : ''
      end
    end
  end
end
