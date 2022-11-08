# frozen_string_literal: true

require 'yaml'
require 'rake'
require 'test_helper'

class TestRakeReformatYaml < Test::Unit::TestCase
  def setup
    Faker::Config.locale = 'es'
  end

  def teardown
    Faker::Config.locale = nil
    File.delete("#{File.dirname(__FILE__)}/format_yaml_test.yml")
  end

  def test_valid_yaml
    File.write("#{File.dirname(__FILE__)}/format_yaml_test.yml", <<~YAML
      en:
        faker:
            male_first_name:
                [Liam, Noah, Oliver, Elijah, James, William, Benjamin, Lucas]
            female_first_name:
                [Emma, Olivia, Ava, Isabella, Sophia, Charlotte, Mia, Amelia]
    YAML
    )

    assert YAML.load_file("#{File.dirname(__FILE__)}/format_yaml_test.yml").is_a?(Hash)
  end

  def test_reformat_yaml_valid
    Rake::Task['reformat_yaml_all'].invoke
    assert YAML.load_file("#{File.dirname(__FILE__)}/format_yaml_test.yml").is_a?(Hash)
  end
end
