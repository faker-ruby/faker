# frozen_string_literal: true

require 'find'
require 'yaml'

desc 'Reformat all yaml files into a common format'
task :reformat_yaml_all do
  reformat_yaml_enum('.')
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
