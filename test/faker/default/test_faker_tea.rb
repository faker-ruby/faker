# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerTea < Test::Unit::TestCase
  def setup
    @tester = Faker::Tea
    @types = Faker::Base.fetch_all('tea.type')
    @varieties_by_type = @types.to_h do |type|
      [type, Faker::Base.fetch_all("tea.variety.#{type.downcase}")]
    end
    @varieties = @varieties_by_type.values.flatten
  end

  def test_variety
    assert(@varieties.all? do |variety|
      variety.match?(/^(?:[A-Z]['.\-a-z]+[\s-])*(?:[A-Z]['.\-a-z]+)$/)
    end)
    assert @varieties.include?(@tester.variety)
  end

  def test_variety_with_argument
    @types.each do |type|
      assert @varieties_by_type[type].include?(@tester.variety(type: type))
    end
  end

  def test_types
    assert @types.all? { |type| type.match?(/^[A-Z][a-z]+$/) }
  end
end
