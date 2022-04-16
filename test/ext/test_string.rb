# frozen_string_literal: true

require_relative '../test_helper'

class TestString < Test::Unit::TestCase
  def setup
    @string = "Maribel's home"
  end

  def test_clear_special_characters
    assert_equal @string.clear_special_characters, 'Maribels home'
  end
end
