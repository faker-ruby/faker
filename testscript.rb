# frozen_string_literal: true

require_relative 'lib/faker'
I18n.config.available_locales = :en

loop do
  puts Faker::TvShows::Spongebob.character
  puts Faker::Movies::StarWars.character
  sleep 10
end
