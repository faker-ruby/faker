# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerComputer < Test::Unit::TestCase
  def setup
    @tester = Faker::Computer
    @platforms = Faker::Base.fetch_all('computer.platform')
  end

  def test_type
    assert @tester.type.match(/\w+/)
  end

  def test_platform
    assert @tester.platform.match(/(\w+ ?){1,3}/)
  end

  def test_stack
    # puts @tester.stack
    assert stack = @tester.stack
                          .match(/\A(?<platform>([[:alnum:]]+\s?){1,5}), (?<os>([[:alnum:]]+-?.?\)?\(?\s?){1,5})\z/)

    platform = stack[:platform]
    search_format_platform = platform.split.length > 1 ? platform.downcase.split.join('_') : platform.downcase
    os = stack[:os]

    oses = Faker::Base.fetch_all("computer.os.#{search_format_platform}")

    assert @platforms.include?(platform)
    assert oses.include?(os)
  end
end
