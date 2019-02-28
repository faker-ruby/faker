# frozen_string_literal: true

desc 'Extract character generators'
task :extract_character_generators do
  regex = /fetch\('(.+\.character(s)?)'\)/
  files = Dir.glob('lib/faker/**/*.rb')
  generators = []
  files.each do |file|
    text = File.open(file).read
    text.each_line do |line|
      match = line.match(regex)
      generators << match[1] if match
    end
  end
  y = { 'en' => { 'faker' => { 'fictional_characters' => generators.sort } } }
  File.write('lib/locales/en/fictional_characters.yml', y.to_yaml.sub!(/^---\n/, ''))
end
