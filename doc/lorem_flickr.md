# Faker::LoremFlickr

```ruby
Faker::LoremFlickr.image #=> "http://loremflickr.com/300/300"

Faker::LoremFlickr.image("50x60") #=> "http://loremflickr.com/50/60"

Faker::LoremFlickr.image("50x60", true) #=> "http://loremflickr.com/g/50/60"

Faker::LoremFlickr.image("50x60", false, ['sports']) #=> "http://loremflickr.com/50/60/sports"

Faker::LoremFlickr.image("50x60", false, ['sports', 'fitness']) #=> "http://loremflickr.com/50/60/sports,fitness"

Faker::LoremFlickr.image("50x60", false, ['sports', 'fitness'], true) #=> "http://loremflickr.com/50/60/sports,fitness/all"

Faker::LoremFlickr.pixelated_image("50x60", ['sports']) #=> "http://loremflickr.com/p/50/60/sports"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness']) #=> "http://loremflickr.com/p/50/60/sports,fitness"

Faker::LoremFlickr.pixelated_image("50x60", ['sports', 'fitness'], true) #=> "http://loremflickr.com/p/50/60/sports,fitness/all"
```
