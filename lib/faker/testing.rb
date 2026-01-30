# # frozen_string_literal: true

# CATEGORIES = {
#   Blockchain: "blockchain",
#   Books: "books",
#   Creature: "creature",
#   Default: "default",
#   Fantasy: "fantasy",
#   Games: "games",
#   JapaneseMedia: "japanese_media",
#   Locations: "locations",
#   Movies: "movies",
#   Music: "music",
#   Quotes: "quotes",
#   Religion: "religion",
#   Sports: "sports",
#   Travel: "travel",
#   TvShows: "tv_shows"
# }

# module Faker
#   # alternative, a mixin to be included on each file instead of writing lazy load on eahc file, i.e., LazyLoadable
#   class Fantasy
#     if ENV['LAZY_LOAD'] == '1'
#       Faker.lazy_load(self)
#     end
#   end
# end

# # for each key, create a file on lib/faker with the value ending with .rb
# # inside, create a class like so:

# module Faker
#   class "Key"
#     if ENV['LAZY_LOAD'] == '1'
#       Faker.lazy_load(self)
#     end
#   end
# end