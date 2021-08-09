# frozen_string_literal: true

require 'yaml'

desc 'Lint the yaml files'
task :lint_yaml do
  require 'syck'

  root_dir = File.absolute_path(File.join(__dir__, '..'))
  Dir[File.join(root_dir, 'lib', 'locales', '**', '*.yml')].each do |file|
    Syck.load_file(file)
  rescue ArgumentError
    puts "File #{file} is malformed."
    raise
  end

  puts "All yaml files are well-formed."
end
