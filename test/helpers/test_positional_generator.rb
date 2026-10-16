# frozen_string_literal: true

require_relative '../test_helper'

class TestPositionalGenerator < Test::Unit::TestCase
  def test_computed_dependencies_follow_declared_order
    generated = Faker::Base.generate(:string) do |g|
      g.lit('2', name: :left)
      g.lit('7', name: :right)
      g.computed(deps: %i[right left]) { |right, left| right.to_i - left.to_i }
    end

    assert_equal('275', generated)
  end

  def test_computed_dependencies_follow_declared_order_with_forward_references
    generated = Faker::Base.generate(:string) do |g|
      g.computed(deps: %i[right left]) { |right, left| right.to_i - left.to_i }
      g.lit('2', name: :left)
      g.lit('7', name: :right)
    end

    assert_equal('527', generated)
  end

  def test_shared_dependencies_follow_each_computations_order
    generated = Faker::Base.generate(:string) do |g|
      g.lit('2', name: :left)
      g.lit('7', name: :right)
      g.computed(deps: %i[left right]) { |left, right| left.to_i - right.to_i }
      g.computed(deps: %i[right left]) { |right, left| right.to_i - left.to_i }
    end

    assert_equal('27-55', generated)
  end

  def test_computed_dependencies_keep_false_and_nil_values
    generated = Faker::Base.generate(:string) do |g|
      g.computed(name: :flag) { false }
      g.computed(name: :empty) { nil }
      g.lit('end', name: :last)
      g.computed(deps: %i[flag empty last]) { |*values| values.inspect }
    end

    assert_equal('falseend[false, nil, "end"]', generated)
  end
end
