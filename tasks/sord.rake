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

  faker_rbi.gsub!('returns(Date)', 'returns(::Date)')
  faker_rbi.gsub!('T.nilable(Date)', 'T.nilable(::Date)')
  faker_rbi.gsub!('T::Array[Date]', 'T::Array[::Date]')
  faker_rbi.gsub!(': Date', ': ::Date')
  faker_rbi.gsub!('T.any(Date, String)', 'T.any(::Date, ::String)')

  # The constant doesn't get output in the RBI, which means that its usage as
  # the default parameter value is invalid. This replaces it with
  # `T.unsafe(nil)` so that Sorbet won't freak out.
  faker_rbi.gsub!(/MILEAGE_MIN|MILEAGE_MAX/, 'T.unsafe(nil)')

  File.write('rbi/faker.rbi', faker_rbi)
end
