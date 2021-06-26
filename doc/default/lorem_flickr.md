# Faker::LoremFlickr

Available since version 1.9.0.

```ruby
# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.image #=> "https://loremflickr.com/300/300"
Faker::LoremFlickr.image(size: "50x60") #=> "https://loremflickr.com/50/60"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/50/60/sports"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/50/60/sports,fitness"
Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.grayscale_image #=> "https://loremflickr.com/g/300/300/all"
Faker::LoremFlickr.grayscale_image(size: "50x60") #=> "https://loremflickr.com/g/50/60/all"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/g/50/60/sports"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/g/50/60/sports,fitness"
Faker::LoremFlickr.grayscale_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/g/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.pixelated_image #=> "https://loremflickr.com/p/300/300/all"
Faker::LoremFlickr.pixelated_image(size: "50x60") #=> "https://loremflickr.com/p/50/60/all"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports']) #=> "https://loremflickr.com/p/50/60/sports"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/p/50/60/sports,fitness"
Faker::LoremFlickr.pixelated_image(size: "50x60", search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/p/50/60/sports,fitness/all"

# Keyword arguments: size, search_terms, match_all
Faker::LoremFlickr.colorized_image #=> "https://loremflickr.com/red/300/300/all"
Faker::LoremFlickr.colorized_image(size: "50x60") #=> "https://loremflickr.com/red/50/60/all"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red') #=> "https://loremflickr.com/red/50/60/all"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports']) #=> "https://loremflickr.com/red/50/60/sports"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports', 'fitness']) #=> "https://loremflickr.com/red/50/60/sports,fitness"
Faker::LoremFlickr.colorized_image(size: "50x60", color: 'red', search_terms: ['sports', 'fitness'], match_all: true) #=> "https://loremflickr.com/red/50/60/sports,fitness/all"
```
