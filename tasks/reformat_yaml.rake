# frozen_string_literal: true

require 'yaml'

desc 'Reformat a yaml file into a common format'
task :reformat_yaml, [:filename] do |_, args|
  args.with_defaults(filename: nil)

  raise ArgumentError, 'A filename is required. `bundle exec rake reformat_yaml["lib/path/to/fil"]`' if args[:filename].nil?

  root_dir = File.absolute_path(File.join(__dir__, '..'))
  target_file = File.join(root_dir, args[:filename])
  reformat_file(target_file)
end

def reformat_file(filename)
  puts "Reformatting #{filename}"

  input = YAML.load_file(filename)
  # Psych outputs non-indented hypendated array list items.
  output = input.to_yaml(line_width: -1)
                .gsub(/(^ *- .+$)/, '  \1') # Indent hyphenated list items
                .sub(/^---\n/, '') # Remove header

  File.write(filename, output)
end
