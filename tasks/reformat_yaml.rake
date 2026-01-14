# frozen_string_literal: true

require 'yaml'

desc 'Reformat all locales'
task :reformat_locales do
  path = File.absolute_path(File.join(__dir__, '..', 'lib', 'locales', '**', '*.yml'))
  locales = Dir[path]
  failures = []

  locales.each do |locale_path|
    reformat_file(locale_path)
  rescue StandardError => e
    failures << "Error reformatting #{locale_path}: #{e.message}"
  end

  puts failures
end

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

  input = YAML.safe_load_file(filename, aliases: true)
  # Psych outputs non-indented hypendated array list items.
  output = input.to_yaml(line_width: -1)
                .gsub(/(^ *- .+$)/, '  \1') # Indent hyphenated list items
                .sub(/^---\n/, '') # Remove header

  File.write(filename, output)
end
