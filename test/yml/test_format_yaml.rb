# frozen_string_literal: true

require 'yaml'
require 'rake'
require 'test_helper'

class TestRakeReformatYaml < Test::Unit::TestCase
  TEST_DIRECTORY = File.dirname(__FILE__)

  def setup
    Faker::Config.locale = 'en'

    File.write("#{TEST_DIRECTORY}/array_style.yml", <<~YAML
      en:
        faker:
            male_first_name:
                [Liam, Noah, Oliver, Elijah, James, William, Benjamin, Lucas]
            female_first_name:
                [Emma, Olivia, Ava, Isabella, Sophia, Charlotte, Mia, Amelia]
    YAML
    )

    File.write("#{TEST_DIRECTORY}/trailing_whitespace.yml", <<~YAML
      en:
        faker:
            male_first_name:
                ["Liam ", " Noah", " Oliver ", "Elijah  ", "  James", "  William  ", "Benjamin  ", "   Lucas"]
            female_first_name:
                ["Emma ", " Olivia", " Ava ", "Isabella  ", "  Sophia", "  Charlotte  ", "Mia  ", "   Amelia"]
    YAML
    )
  end

  def teardown
    Faker::Config.locale = nil
    # File.delete("#{TEST_DIRECTORY}/array_style.yml")
    # File.delete("#{TEST_DIRECTORY}/trailing_whitespace.yml")
  end

  ARRAY_FILE = File.expand_path('array_style.yml', '../faker/test/yml')
  TRAILING_WHITESPACE_FILE = File.expand_path('trailing_whitespace.yml', '../faker/test/yml')

  def test_valid_yaml
    Rake::Task['reformat_yaml_all'].invoke(ARRAY_FILE)

    Rake::Task['reformat_yaml_all'].invoke(TRAILING_WHITESPACE_FILE)
    assert YAML.load_file("#{TEST_DIRECTORY}/array_style.yml").is_a?(Hash)
  end
end
