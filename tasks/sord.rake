# frozen_string_literal: true

desc 'Run Sord to autogenerate a Faker RBI.'
task :sord do
  require 'sord'

  system('sord rbi/faker.rbi --no-sord-comments --replace-errors-with-untyped --replace-unresolved-with-untyped --skip-constants')

  faker_rbi = File.read('rbi/faker.rbi')

  # Remove an undefined constant from the parameters.
  faker_rbi.gsub!('NOT_GIVEN', 'T.unsafe(nil)')
  # Fix a line broken by YARD's parameter generation.
  faker_rbi.gsub!(
    'def self.negative(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: -5000.00,, to: -1.00)); end',
    'def self.negative(legacy_from = T.unsafe(nil), legacy_to = T.unsafe(nil), from: -5000.00, to: -1.00); end'
  )

  # Replace instances of `String` with `::String` so it doesn't try to use `Faker::String`
  faker_rbi.gsub!('returns(String)', 'returns(::String)')
  faker_rbi.gsub!('T.nilable(String)', 'T.nilable(::String)')
  faker_rbi.gsub!('T::Array[String]', 'T::Array[::String]')
  faker_rbi.gsub!(': String', ': ::String')

  File.write('rbi/faker.rbi', faker_rbi)
end
