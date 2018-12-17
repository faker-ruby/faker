# frozen_string_literal: true

require 'yaml'

desc 'Reformat all yaml files into a common format'
task :reformat_yaml do
  lib_dir = File.absolute_path(File.join(__dir__, '..', 'lib'))
  glob_str = File.join(lib_dir, '**/*.yml')

  Dir.glob(glob_str) do |filename|
    puts "reformatting #{filename}"

    input = YAML.load_file(filename)
    output = input.to_yaml

    output.sub!(/^---\n/, '') # remove header

    File.write(filename, output)
  end
end
