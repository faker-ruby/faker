require 'yaml'
require 'active_support/inflector'

def find_set(line)
  return nil unless line[0..6] == 'Faker::'
  line.split[0].split('::')[1].split('(')[0]
end
# For each doc file
# (Use Dir.foreach)

checked = []

Dir.foreach('./doc') do |doc|
  if doc[-3..-1] == '.md'
    file_path = './doc/' + doc
    lines = File.readlines(file_path)
    counted = lines.reduce(Array.new) do |new_lines, line|
      new_lines << line
      # For each line that starts w/ Faker::
      set = find_set(line)
      if set && !checked.include?(set)
        checked << set
        new_line = "## Count ##\n"
        category, subset = set.split('.')
        category = category.underscore

        # For each localization file
        Dir.foreach('./lib/locales') do |localization|
          if localization[-4..-1] == '.yml'
            yml_path = './lib/locales/' + localization
            yml = YAML.load_file(yml_path)
            locale = yml.keys[0]

            # Find corresponding key
            yml_set = yml[locale]['faker'][category][subset] if yml[locale]['faker'][category]
            yml_set = yml[locale]['faker'][category][subset.pluralize] if yml[locale]['faker'][category] && !yml_set
            new_line += "# #{locale}: " unless yml_set.nil?
            if yml_set.nil?
              # If it points to nothing
                # Write `localization name: 'Not present'` to the end of the line after the Ruby snippet
            elsif yml_set.is_a?(Array) && yml_set.length > 1
              # If it points to an array
                # Write `localization name: count to the end of the line after the Ruby snippet
              new_line += yml_set.length.to_s + ' '
            else
              # If it points to something else
                # Write `localization name: 'dynamic'` to the end of the line after the Ruby snippet
              new_line += 'dynamic '
            end
          end
        end
        new_lines << new_line + "\n" unless new_line == "## Count ##\n"
      end
      new_lines
    end
    File.open(file_path, 'w') do |file|
      file.write(counted.join)
      file.close
    end
  end
end
