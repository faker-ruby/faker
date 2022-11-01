# frozen_string_literal: true

require 'find'
require 'yaml'

# This monkey patch is related to the Ruby 3.1 / Psych 4.x incompatibility described in this issue: 
# https://bugs.ruby-lang.org/issues/17866
module YAML
  class << self
    alias_method :load, :unsafe_load if YAML.respond_to? :unsafe_load
  end
end

desc 'Reformat all yaml files into a common format'
task :reformat_yaml_all, [:file_name] do |t, args|
  args.with_defaults(file_name: '.') # Default to current directory
  reformat_yaml_enum(args[:file_name])
end

##
# This method is used to format .yml files in the project into a common format
#
# @return [Boolean] true if files were formatted, false if not
#
# @example rake format_yaml_enum [/path/to/file.yml]
# key: [value1, value2, value3] =>
# key:
#   - value1
#   - value2
#
# #=> true
# @faker version next


def reformat_yaml_enum(path_name)
  files_touched = 0
  Find.find(path_name) do |file|
    parent_directory = File.expand_path('..', file).split('/')

    # Psych doesn't like Japanese and we don't want to mess with workflows
    next if parent_directory.include?('.github') || parent_directory.include?('ja')
    next unless File.file?(file) && (File.extname(file) == '.yml')

    puts "Reformatting #{file}"

    input = YAML.load_file(file)
    # Psych outputs non-indented hypendated array list items.
    output = input.to_yaml(line_width: -1)
                  .gsub(/(^ *- .+$)/, '  \1') # Indent hypenated list items
                  .sub(/^---\n/, '') # Remove header

    File.write file, output
    files_touched += 1
  end
  puts "All done! #{files_touched} files reformatted."
  !!files_touched
end
