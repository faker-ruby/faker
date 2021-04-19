# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerCreatureBird < Test::Unit::TestCase
  def setup
    @tester = Faker::Creature::Bird
    @common_order_map = I18n.translate('faker.creature.bird.order_common_map')
  end

  def test_orders
    assert @tester.order.match(/[A-Z]\w+formes/)
  end

  def test_anatomies
    assert @tester.anatomy.match(/[a-z]+/)
  end

  def test_anatomy_past_tenses
    assert @tester.anatomy_past_tense.match(/[a-z]+ed$/)
  end

  def test_geos
    assert @tester.geo.match(/[A-Za-z][a-z ]/)
  end

  def test_colors
    assert @tester.color.match(/[a-z]+/)
  end

  def test_silly_adjectives
    assert @tester.emotional_adjective.match(/[a-z]+/) && @tester.silly_adjective.match(/[a-z]+/)
  end

  def test_adjectives
    assert @tester.adjective.match(/[a-z]+/)
  end

  def test_common_names
    assert @tester.common_name.match(/[a-z]+/)
  end

  def test_common_names_with_specific_order
    specific_order = @tester.order
    name = @tester.common_name specific_order
    assert_includes @common_order_map[specific_order.to_sym].map(&:downcase), name
  end

  def test_common_names_with_specific_but_imaginary_order
    not_real_order = :Somethingaformes
    assert_raises(ArgumentError) { @tester.common_name not_real_order }
  end

  def test_common_name_with_bad_parameter
    stupid_param = 9
    assert_raises(TypeError) { @tester.common_name stupid_param }
  end

  def test_order_with_common_names
    entry = @tester.order_with_common_name
    assert_includes(@common_order_map.keys, entry[:order].to_sym) && \
      assert_includes(@common_order_map[entry[:order]], entry[:common_name])
  end

  def test_specific_order_with_common_names
    specific_order = @tester.order
    entry = @tester.order_with_common_name specific_order
    assert_includes(@common_order_map[specific_order.to_sym], entry[:common_name])
  end

  def test_plausible_common_names
    patterns = [
      /[A-Z][a-z]+'s [a-z]+/,
      /[A-Z][a-z]+ [a-z]+/,
      /[A-Z][a-z]+ [a-z]+ [a-z]+/,
      /[A-Z][a-z]+-[a-z]+ed [a-z]+/
    ]
    name = @tester.plausible_common_name
    assert patterns.collect { |pattern| pattern.match? name }.any?,
           "Faker::Creature::Bird#plausible_common_name failed on '#{name}'"
  end

  def test_implausable_common_names
    patterns = [
      /[A-Z][a-z]+'s [a-z]+ [a-z]+/,
      /[A-Z][a-z]+ [a-z]+ [a-z]+/,
      /[A-Z][a-z]+-[a-z]+ed [a-z]+ [a-z]+/
    ]
    name = @tester.implausible_common_name
    assert patterns.collect { |pattern| pattern.match? name }.any?,
           "Faker::Creature::Bird#implausible_common_name failed on '#{name}'"
  end
end
