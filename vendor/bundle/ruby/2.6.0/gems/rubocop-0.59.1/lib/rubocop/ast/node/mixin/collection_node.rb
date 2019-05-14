# frozen_string_literal: true

module RuboCop
  module AST
    # A mixin that helps give collection nodes array polymorphism.
    module CollectionNode
      extend Forwardable

      ARRAY_METHODS =
        (Array.instance_methods - Object.instance_methods - [:to_a]).freeze

      def_delegators :to_a, *ARRAY_METHODS
    end
  end
end
