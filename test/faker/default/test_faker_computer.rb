# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerComputer < Test::Unit::TestCase
  def setup
    @tester = Faker::Computer
    @platforms = Faker::Base.fetch_all('computer.platform')
  end

  def test_type
    assert_match(/\w+/, @tester.type)
  end

  def test_platform
    assert_match(/(\w+ ?\d?){1,3}/, @tester.platform)
  end

  def test_stack
    assert stack = @tester.stack
                          .match(/\A(?<platform>(?:[[:alnum:]]+\s?){1,5}), (?<os>(?:[[:alnum:]]+-?.?\)?\(?\s?){1,5})\z/)

    platform = stack[:platform]
    search_format_platform = platform.downcase
    os = stack[:os]

    oses = Faker::Base.fetch_all("computer.os.#{search_format_platform}")

    assert_includes @platforms, platform
    assert_includes oses, os
  end
end
