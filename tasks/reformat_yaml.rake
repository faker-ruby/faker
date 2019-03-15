# frozen_string_literal: true

require 'yaml'

desc 'Reformat a yaml file into a common format'
task :reformat_yaml, [:filename] do |_, args|
  args.with_defaults(filename: nil)

  if args[:filename].nil?
    raise ArgumentError, 'A filename is required. `bundle exec rake reformat_yaml["lib/path/to/fil"]`'
  end

  root_dir = File.absolute_path(File.join(__dir__, '..'))
  target_file = File.join(root_dir, args[:filename])
  reformat_file(target_file)
end

def reformat_file(filename)
  puts "reformatting #{filename}"

  input = YAML.load_file(filename)
  output = input.to_yaml

  output.sub!(/^---\n/, '') # remove header

  File.write(filename, output)
end
