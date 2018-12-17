# frozen_string_literal: true

require 'yaml'

desc 'Reformat all yaml files into a common format'
task :reformat_yaml, [:filename] do |_, args|
  args.with_defaults(filename: :all)

  root_dir = File.absolute_path(File.join(__dir__, '..'))

  if args[:filename] == :all
    glob_str = File.join(root_dir, 'lib/**/*.yml')
    Dir.glob(glob_str) { |filename| reformat_file(filename) }
  else
    target_file = File.join(root_dir, args[:filename])
    reformat_file(target_file)
  end
end

def reformat_file(filename)
  puts "reformatting #{filename}"

  input = YAML.load_file(filename)
  output = input.to_yaml

  output.sub!(/^---\n/, '') # remove header

  File.write(filename, output)
end
