# frozen_string_literal: true

require_relative '../../test_helper'

class TestFakerComputer < Test::Unit::TestCase
  def setup
    @tester = Faker::Computer
    @platforms = Faker::Base.fetch_all('computer.platform')
    @types = Faker::Base.fetch_all('computer.type')
    @oses = Faker::Base.fetch_all('computer.os')
  end

  def test_stack
    assert stack = @tester.stack
                         .match(/\A(?<platform>([[:alnum:]]+ ?){1,5}), (?<os>([[:alnum:]]+-?.?\)?\(? ?){1,5})\z/)

    platform = stack[:platform]
    search_format_platform = platform.split.length > 1 ? platform.downcase.split.join('_') : platform.downcase
    os = stack[:os]
    
    oses = Faker::Base.fetch_all("computer.os.#{search_format_platform}")

    assert @platforms.include?(platform)
    assert oses.include?(os)
    
  end
end