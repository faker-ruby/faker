# frozen_string_literal: true

CATEGORIES = {
  Blockchain: 'blockchain',
  Books: 'books',
  Creature: 'creature',
  Default: 'default',
  Fantasy: 'fantasy',
  Games: 'games',
  JapaneseMedia: 'japanese_media',
  Locations: 'locations',
  Movies: 'movies',
  Music: 'music',
  Quotes: 'quotes',
  Religion: 'religion',
  Sports: 'sports',
  Travel: 'travel',
  TvShows: 'tv_shows'
}.freeze

def template(k)
  "# frozen_string_literal: true

  module Faker
    class #{k}
      if ENV['LAZY_LOAD'] == '1'
        Faker.lazy_load(self)
      end
    end
  end"
end

CATEGORIES.each do |k, v|
  File.write(File.join('lib', 'faker', "#{v}.rb"), template(k))
end
