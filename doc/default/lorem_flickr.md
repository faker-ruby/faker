# Faker::LoremFlickr

Available since version 1.9.0.

```ruby
# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.image #=> "http://loremflickr.com/300/300"
Faker::LoremFlickr.image(size: "50x60") #=> "http://loremflickr.com/50/60"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports']) #=> "http://loremflickr.com/50/60/sports"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "http://loremflickr.com/50/60/sports,fitness"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "http://loremflickr.com/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.grayscale_image #=> "http://loremflickr.com/g/300/300/all"
Faker::LoremFlickr.grayscale_image(size: "50x60") #=> "http://loremflickr.com/g/50/60/all"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports']) #=> "http://loremflickr.com/g/50/60/sports"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "http://loremflickr.com/g/50/60/sports,fitness"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "http://loremflickr.com/g/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.pixelated_image #=> "http://loremflickr.com/p/300/300/all"
Faker::LoremFlickr.pixelated_image(size: "50x60") #=> "http://loremflickr.com/p/50/60/all"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports']) #=> "http://loremflickr.com/p/50/60/sports"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "http://loremflickr.com/p/50/60/sports,fitness"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "http://loremflickr.com/p/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.colorized_image #=> "http://loremflickr.com/red/300/300/all"
Faker::LoremFlickr.colorized_image(size: "50x60") #=> "http://loremflickr.com/red/50/60/all"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red') #=> "http://loremflickr.com/red/50/60/all"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports']) #=> "http://loremflickr.com/red/50/60/sports"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports', 'fitness']) #=> "http://loremflickr.com/red/50/60/sports,fitness"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports', 'fitness'], match_all: true) #=> "http://loremflickr.com/red/50/60/sports,fitness/all"
```
